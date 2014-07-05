class Projection < ActiveRecord::Base
  validates_presence_of :player

  belongs_to :player,
    inverse_of :projections
end
