class PlayerSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :team, :position
  has_many :projections
end
