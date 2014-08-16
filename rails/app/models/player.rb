class Player < ActiveRecord::Base
  validates_presence_of :name, :position, :team
  validates_format_of :name, without: /D\/ST/

  has_many :projections,
    inverse_of: :player

  has_many :costs,
    inverse_of: :player

  def passing_completions
    passing_completions = projections.map{ |projection| projection.passing_completions }
    median(passing_completions)
  end

  def passing_attempts
    passing_attempts = projections.map{ |projection| projection.passing_attempts }
    median(passing_attempts)
  end

  def passing_tds
    passing_tds = projections.map{ |projection| projection.passing_tds }
    median(passing_tds)
  end

  def passing_yards
    passing_yards = projections.map{ |projection| projection.passing_yards }
    median(passing_yards)
  end

  def interceptions
    interceptions = projections.map{ |projection| projection.interceptions }
    median(interceptions)
  end

  def rushing_attempts
    rushing_attempts = projections.map{ |projection| projection.rushing_attempts }
    median(rushing_attempts)
  end

  def rushing_yards
    rushing_yards = projections.map{ |projection| projection.rushing_yards }
    median(rushing_yards)
  end

  def rushing_tds
    rushing_tds = projections.map{ |projection| projection.rushing_tds }
    median(rushing_tds)
  end

  def receiving_yards
    receiving_yards = projections.map{ |projection| projection.receiving_yards }
    median(receiving_yards)
  end

  def receiving_receptions
    receiving_receptions = projections.map{ |projection| projection.receiving_receptions }
    median(receiving_receptions)
  end

  def receiving_tds
    receiving_tds = projections.map{ |projection| projection.receiving_tds }
    median(receiving_tds)
  end

  def fumbles
    fumbles = projections.map{ |projection| projection.fumbles unless projection.fumbles.blank? }
    median(fumbles)
  end

  def auction_value
    costs = self.costs.map{ |cost| cost.value }
    median(costs) * 1.2
  end

  def projected_points
    (passing_completions * 0.25) + (passing_tds * 4) + (passing_yards * 0.04) + (interceptions * -2) +
    (rushing_yards * 0.1) + (rushing_tds * 6) + (receiving_receptions * 0.5) + (receiving_yards * 0.1) +
    (receiving_tds * 6) + (fumbles * -2)
  end

  def self.order_by_points
    Player.all.sort {|a,b| b.projected_points <=> a.projected_points}
  end

  private
  def median(array)
    no_nils = array.compact
    sorted = no_nils.sort
    len = sorted.length
    if sorted[(len - 1) / 2].nil?
      0
    else
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
  end
end
