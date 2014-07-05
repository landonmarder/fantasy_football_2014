require 'open-uri'
class Projection < ActiveRecord::Base

  belongs_to :player,
    inverse_of: :projections

  def self.scrape_ESPN(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('.pncPlayerRow').each do |row|
      name = row.children[1].children.text.split(',').first
      binding.pry
    end
  end
end
