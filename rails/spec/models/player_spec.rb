require 'rails_helper'

describe Player do
  it { should have_valid(:name).when('Peyton Manning') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:position).when('QB') }
  it { should_not have_valid(:position).when(nil, '') }

  it { should have_valid(:team).when('Den') }
  it { should_not have_valid(:team).when(nil, '') }

  it { should have_many(:projections) }
end
