require 'rails_helper'

describe Player do
  it { should have_valid(:name).when('Peyton Manning') }
  it { should_not have_valid(:name).when(nil, '', 'Buccaneers D/ST') }

  it { should have_valid(:position).when('QB') }
  it { should_not have_valid(:position).when(nil, '') }

  it { should have_valid(:team).when('Den') }
  it { should_not have_valid(:team).when(nil, '') }

  it { should have_many(:projections) }

  it { should have_many(:costs) }

  it 'should calculate the median of rushing yards, odd numbers of projections' do
    ap = FactoryGirl.create(:player)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 100)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 50)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 102)

    expect(ap.rushing_yards).to eq(100)
  end

  it 'should calculate the median of rushing yards, even numbers of projections' do
    ap = FactoryGirl.create(:player)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 100)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 50)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 102)
    FactoryGirl.create(:projection, player: ap, rushing_yards: 75)

    expect(ap.rushing_yards).to eq(87.5)
  end
end
