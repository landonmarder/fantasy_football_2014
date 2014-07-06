class ProjectionSerializer < ActiveModel::Serializer
  attributes :id, :passing_completions, :passing_attempts, :passing_yards,
  :passing_tds, :interceptions, :rushing_attempts, :rushing_tds, :receiving_yards,
  :receiving_receptions, :receiving_tds, :fumbles
end
