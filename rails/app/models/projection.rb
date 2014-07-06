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
    end
  end
end
