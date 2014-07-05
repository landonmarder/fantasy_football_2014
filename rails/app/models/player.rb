class Player < ActiveRecord::Base
  validates_presence_of :name, :position, :team

  has_many :projections,
    inverse_of :player
end
