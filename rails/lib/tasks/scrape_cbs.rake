desc 'scrape cbs for latest fantasy projections'
task :scrape_cbs => :environment do
  puts 'Starting to scrape CBS'
  Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/QB/season', 25)
  puts 'QBs are complete'
  Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/RB/season/', 49)
  puts 'RBs are complete'
  Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/WR/season/', 49)
  Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/WR/season/?&start_row=51', 20)
  puts 'WRs are complete'
  Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/TE/season/', 25)
  puts 'TEs are complete'
  puts 'Scraping finished!'
end
