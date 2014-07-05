require 'rails_helper'

describe Projection do
  it { should have_valid(:player).when(Player.new) }
  it { should_not have_valid(:player).when(nil, '') }

  it { should have_valid(:passing_completions).when(12) }
  it { should_not have_valid(:passing_completions).when(nil, '12') }

  it { should have_valid(:passing_attempts).when(50) }
  it { should_not have_valid(:passing_attempts).when(nil, '50') }

  it { should have_valid(:passing_yards).when(50) }
  it { should_not have_valid(:passing_yards).when(nil, '50') }

  it { should have_valid(:passing_tds).when(50) }
  it { should_not have_valid(:passing_tds).when(nil, '50') }

  it { should have_valid(:interceptions).when(50) }
  it { should_not have_valid(:interceptions).when(nil, '50') }

  it { should have_valid(:rushing_attempts).when(50) }
  it { should_not have_valid(:rushing_attempts).when(nil, '50') }

  it { should have_valid(:rushing_tds).when(50) }
  it { should_not have_valid(:rushing_tds).when(nil, '50') }

  it { should have_valid(:receiving_yards).when(50) }
  it { should_not have_valid(:receiving_yards).when(nil, '50') }

  it { should have_valid(:receiving_receptions).when(50) }
  it { should_not have_valid(:receiving_receptions).when(nil, '50') }

  it { should have_valid(:receiving_tds).when(50) }
  it { should_not have_valid(:receiving_tds).when(nil, '50') }

  it { should have_valid(:fumbles).when(50) }
  it { should_not have_valid(:fumbles).when(nil, '50') }
end
