require 'rest_client'
require 'json'
require 'pry'
require 'csv'

response = RestClient.get 'http://fantasy-football-aggregator.herokuapp.com/api/players'
json = JSON.parse(response)

players = json['players']

file_name = "projections/#{Time.now.strftime('%m-%d-%Y')}-football-projections.csv"

CSV.open(file_name, 'wb') do |row|
  row << ['Name', 'Team', 'Position', 'Avg. Auction Value','ADP', 'Projected Points',
    'Passing Completions', 'Passing TDs', 'Passing Yards', 'Interceptions', 'Rushing Yards',
    'Rushing TDs', 'Receiving Yards', 'Receptions', 'Receiving TDs', 'Fumbles']
  players.each do |player|
    row << [player['name'], player['team'], player['position'], player['auction_value'], player['adp'],
    player['projected_points'], player['passing_completions'], player['passing_tds'],
    player['passing_yards'], player['interceptions'], player['rushing_yards'], player['rushing_tds'],
    player['receiving_yards'], player['receiving_receptions'], player['receiving_tds'], player['fumbles']]
  end
end
