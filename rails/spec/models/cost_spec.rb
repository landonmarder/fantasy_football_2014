require 'rails_helper'

RSpec.describe Cost, :type => :model do
  it { should have_valid(:player).when(FactoryGirl.create(:player)) }
  it { should_not have_valid(:player).when(nil) }

  it { should have_valid(:value).when(34) }
  it { should_not have_valid(:value).when('$34', nil, '') }

  it { should have_valid(:adp).when(2.4) }

  it 'should get auction values from Yahoo' do
    total_values = Cost.all.length

    Cost.get_auction_values('http://games.espn.go.com/ffl/livedraftresults?sort=aav')
    expect(Cost.all.length).to eq(total_values + 183)
    expect(Cost.all.first.value).to eq(59.4)
    expect(Cost.all.first.adp).to eq(2.1)
  end
end
