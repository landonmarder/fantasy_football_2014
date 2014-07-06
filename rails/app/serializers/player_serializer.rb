class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :team, :position
  # has_many :projections
end
