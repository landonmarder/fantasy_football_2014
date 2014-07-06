require 'rails_helper'

describe Projection do
  it { should belong_to(:player) }

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

  end
end
