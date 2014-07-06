desc 'scrape espn for latest fantasy projections'
task :scrape_espn => :environment do
  puts 'Starting to scrape ESPN ...'
  Projection.scrape_ESPN("http://games.espn.go.com/ffl/tools/projections?&startIndex=0")
  puts 'First 40 done'
  Projection.scrape_ESPN("http://games.espn.go.com/ffl/tools/projections?&startIndex=40")
  puts 'First 80 done'
  Projection.scrape_ESPN("http://games.espn.go.com/ffl/tools/projections?&startIndex=80")
  puts 'First 120 done'
  Projection.scrape_ESPN("http://games.espn.go.com/ffl/tools/projections?&startIndex=120")
  puts 'First 160 done'
  Projection.scrape_ESPN("http://games.espn.go.com/ffl/tools/projections?&startIndex=160")
  puts 'Scraping finished! 200 Projections complete'
end
