require 'open-uri'

class Cost < ActiveRecord::Base
  validates_presence_of :player
  validates_numericality_of :value

  belongs_to :player,
    inverse_of: :costs

  def self.get_auction_values(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('.tableBody tr').each do |row|
      if row.children[0].children.text.to_i > 0
        name = row.children[1].children.text.split(',').first
        player = Player.find_or_initialize_by(name: name)
        unless row.children[1].children.text.split(',')[1].nil?
          player.position = row.children[2].children.text
          player.team = row.children[1].children.text.split(',')[1].squish
          if player.save
            value = row.children[5].children.text.to_f
            adp = row.children[3].children.text.to_f
            cost = Cost.new(player: player, value: value, adp: adp)
            cost.save
          end
        end
      end
    end
  end
end
