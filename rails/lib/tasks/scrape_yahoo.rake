desc 'scrape yahoo for latest fantasy projections'
task :scrape_yahoo => :environment do
  puts 'Starting to scrape Yahoo ...'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?&sort=PR&sdir=1&status=A&pos=O&stat1=S_PS_2014&jsenabled=1&jsenabled=1')
  puts 'First 25 done'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?status=A&pos=O&cut_type=9&stat1=S_PS_2014&myteam=0&sort=PR&sdir=1&count=25')
  puts 'First 50 done'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?status=A&pos=O&cut_type=9&stat1=S_PS_2014&myteam=0&sort=PR&sdir=1&count=50')
  puts 'First 75 done'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?status=A&pos=O&cut_type=9&stat1=S_PS_2014&myteam=0&sort=PR&sdir=1&count=75')
  puts 'First 125 done'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?status=A&pos=O&cut_type=9&stat1=S_PS_2014&myteam=0&sort=PR&sdir=1&count=100')
  puts 'First 150 done'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?status=A&pos=O&cut_type=9&stat1=S_PS_2014&myteam=0&sort=PR&sdir=1&count=125')
  puts 'First 175 done'
  Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?status=A&pos=O&cut_type=9&stat1=S_PS_2014&myteam=0&sort=PR&sdir=1&count=150')
  puts 'Scraping finished! 200 Projections complete'
end
