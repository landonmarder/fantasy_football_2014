require 'rails_helper'

describe Projection do
  it { should belong_to(:player) }

  it { should have_valid(:source).when('ESPN') }
  it { should_not have_valid(:source).when(nil, '') }

  it 'should scrape ESPN for new projections' do
    # Making assumption these guys will be in the top 40, adjust if injuries!
    total_projections = Projection.all.length
    Projection.scrape_ESPN('http://games.espn.go.com/ffl/tools/projections?&startIndex=0')

    expect(Player.all.length).to eq(40)
    ap = Player.find_by(name: 'Adrian Peterson')
    expect(ap.team).to eq('Min')
    expect(ap.position).to eq('RB')
    expect(ap.projections.first.passing_completions).to eq(0)
    expect(ap.projections.first.rushing_yards).to eq(1365)

    dm = Player.find_by(name: 'Doug Martin')
    expect(dm.team).to eq('TB')
    expect(dm.position).to eq('RB')

    peyton = Player.find_by(name: 'Peyton Manning')
    expect(peyton.team).to eq('Den')
    expect(peyton.position).to eq('QB')
    expect(peyton.projections.first.passing_yards).to eq(5210)

    expect(Projection.all.length).to eq(total_projections + 40)
  end

  it 'should scrape YAHOO for new projections' do
    total_projections = Projection.all.length
    Projection.scrape_YAHOO('http://football.fantasysports.yahoo.com/f1/12992/players?&sort=PR&sdir=1&status=A&pos=O&stat1=S_PS_2014&jsenabled=1&jsenabled=1')

    expect(Player.all.length).to eq(25)
    ap = Player.find_by(name: 'Adrian Peterson')
    expect(ap.team).to eq('Min')
    expect(ap.position).to eq('RB')
    expect(ap.projections.first.passing_completions).to eq(0)
    expect(ap.projections.first.rushing_yards).to eq(1436)
    expect(ap.projections.first.receiving_receptions).to eq(50.6)

    peyton = Player.find_by(name: 'Peyton Manning')
    expect(peyton.team).to eq('Den')
    expect(peyton.position).to eq('QB')
    expect(peyton.projections.first.passing_yards).to eq(5395)

    expect(Projection.all.length).to eq(total_projections + 25)
  end

  it 'should scrape CBSSports for new projections: qbs' do
    total_projections = Projection.all.length
    Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/QB/season', 20)
    expect(Player.all.length).to eq (total_projections + 20)

    peyton = Player.find_by(name: 'Peyton Manning')
    expect(peyton.team).to eq('DEN')
    expect(peyton.position).to eq('QB')
    expect(peyton.projections.first.passing_yards).to eq(5325.5)
  end

  it 'should scrape CBSSports for new projections:rbs' do
    total_projections = Projection.all.length
    Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/RB/season/', 40)
    expect(Player.all.length).to eq (total_projections + 40)

    ap = Player.find_by(name: 'Adrian Peterson')
    expect(ap.team).to eq('MIN')
    expect(ap.position).to eq('RB')
    expect(ap.projections.first.rushing_yards).to eq(1367.5)
  end

  it 'should scrape CBSSPorts for new projections:wr/te' do
    total_projections = Projection.all.length
    Projection.scrape_CBS('http://fantasynews.cbssports.com/fantasyfootball/stats/weeklyprojections/WR/season/', 49)
    expect(Player.all.length).to eq (total_projections + 49)

    megatron = Player.find_by(name: 'Calvin Johnson')
    expect(megatron.team).to eq('DET')
    expect(megatron.position).to eq('WR')
    expect(megatron.projections.first.receiving_yards).to eq(1584.0)
  end
end
