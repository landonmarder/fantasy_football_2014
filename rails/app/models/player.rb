class Player < ActiveRecord::Base
  validates_presence_of :name, :position, :team
  validates_format_of :name, without: /D\/ST/

  has_many :projections,
    inverse_of: :player
end
