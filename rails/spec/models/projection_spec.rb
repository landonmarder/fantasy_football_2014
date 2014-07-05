require 'rails_helper'

describe Projection do
  it { should belong_to(:player) }

  it 'should scrape ESPN for new projections' do
    # Making assumption that AP will always be first ranked, will need to change if different :)
    total_projections = Projection.all.length
    Projection.scrape_ESPN('http://games.espn.go.com/ffl/tools/projections?&startIndex=0')

    expect(Projection.all.length).to eq(total_projections + 40)
    expect(Projection.all.first.player.name).to eq('Adrian Peterson')
  end
end
