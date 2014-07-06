require 'open-uri'
class Projection < ActiveRecord::Base
  validates_presence_of :source

  belongs_to :player,
    inverse_of: :projections

  def self.scrape_ESPN(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('.pncPlayerRow').each do |row|
      name = row.children[1].children.text.split(',').first
      player = Player.find_or_initialize_by(name: name)
      player.position = Projection.position_espn(row.children[1].text.split(',').last)
      player.team = Projection.team_espn(row.children[1].text.split(',').last)
      player.save

      if player.save
        projection = Projection.new(
          player: player,
          source: 'ESPN',
          passing_completions: row.children[2].text.split('/').first.to_f,
          passing_attempts: row.children[2].text.split('/').last.to_f,
          passing_yards: row.children[3].text.to_f,
          passing_tds: row.children[4].text.to_f,
          interceptions: row.children[5].text.to_f,
          rushing_attempts: row.children[6].text.to_f,
          rushing_yards: row.children[7].text.to_f,
          rushing_tds: row.children[8].text.to_f,
          receiving_receptions: row.children[9].text.to_f,
          receiving_yards: row.children[10].text.to_f,
          receiving_tds: row.children[11].text.to_f
        )

        projection.save
      end
    end
  end

  def self.scrape_YAHOO(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('tbody tr').each do |row|
      name = row.children[1].css('.name').text
      if name.length > 0
        player = Player.find_or_initialize_by(name: name)
        player.position = row.children[1].css('span').children[-3]
        player.position = row.children[1].css('span').children[-3].text.split('-').last.delete(' ')
        player.team = row.children[1].css('span').children[-3].text.split('-').first.delete(' ')
        if player.save
          projection = Projection.new(
              player: player,
              source: 'Yahoo',
              passing_completions: convert_yahoo(row.children[8].text),
              passing_yards: convert_yahoo(row.children[9].text),
              passing_tds: convert_yahoo(row.children[10].text),
              interceptions: convert_yahoo(row.children[11].text),
              rushing_yards: convert_yahoo(row.children[12].text),
              rushing_tds: convert_yahoo(row.children[13].text),
              receiving_receptions: convert_yahoo(row.children[14].text),
              receiving_yards: convert_yahoo(row.children[15].text),
              receiving_tds: convert_yahoo(row.children[16].text),
              fumbles: convert_yahoo(row.children[19].text),
            )
          projection.save
        end
      end
    end
  end

  private
  def self.position_espn(string)
    info = Projection.sanitize_position_team_espn(string)
    info[-2..-1]
  end

  def self.team_espn(string)
    info = Projection.sanitize_position_team_espn(string)
    info[0..-4]
  end

  def self.sanitize_position_team_espn(string)
    if string[-1] == 'B' || string[-1] == 'E' || string[-1] == 'R'
      string[1..-1]
    else
      string[1..-4]
    end
  end

  def self.convert_yahoo(string)
    string.gsub(',','').to_f
  end
end
