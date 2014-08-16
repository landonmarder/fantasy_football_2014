class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :team, :position, :passing_completions,
  :passing_tds, :passing_yards, :interceptions, :rushing_yards,
  :rushing_tds, :receiving_yards, :receiving_receptions, :receiving_tds, :fumbles, :auction_value, :projected_points
end
