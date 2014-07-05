# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :projection do
    player :player
    passing_completions 21
    passing_attempts 25
    passing_yards 200
    passing_td 25
    interceptions 2
    rushing_attempts 20
    rushing_yards 50
    rushing_tds 2
    receiving_yards 4
    receiving_receptions 2
    receiving_tds 0
    fumbles 0
  end
end
