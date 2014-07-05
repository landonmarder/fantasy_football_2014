class Projection < ActiveRecord::Base

  belongs_to :player,
    inverse_of: :projections
end
