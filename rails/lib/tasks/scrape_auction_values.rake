desc 'scrape yahoo for latest auction values'
task :scrape_auction_values => :environment do
  puts 'Starting to get the latest auction values'
  Cost.get_auction_values('http://games.espn.go.com/ffl/livedraftresults?sort=aav')
  puts 'Getting auction values completed!'
end
