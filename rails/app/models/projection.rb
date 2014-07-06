require 'open-uri'
class Projection < ActiveRecord::Base

  belongs_to :player,
    inverse_of: :projections

  def self.scrape_ESPN(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('.pncPlayerRow').each do |row|
      name = row.children[1].children.text.split(',').first
      player = Player.find_or_initialize_by(name: name)
      player.position = row.children[1].text.split(',')[1].delete(' ')[0..2]
      player.team = row.children[1].text.split(',')[1].delete(' ')[4..5]
      player.save

      projection = Projection.new(
        player: player,
        passing_completions: row.children[2].text.split('/').first.to_i,
        passing_attempts: row.children[2].text.split('/').last.to_i,
        passing_yards: row.children[3].text.to_i,
        passing_tds: row.children[4].text.to_i,
        interceptions: row.children[5].text.to_i,
        rushing_attempts: row.children[6].text.to_i,
        rushing_yards: row.children[7].text.to_i,
        rushing_tds: row.children[8].text.to_i,
        receiving_receptions: row.children[9].text.to_i,
        receiving_yards: row.children[10].text.to_i,
        receiving_tds: row.children[11].text.to_i
      )

      projection.save
    end
  end
end
