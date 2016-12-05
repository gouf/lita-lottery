require "spec_helper"

describe Lita::Handlers::Lottery, lita_handler: true do
  it { is_expected.to route('lottery') }
  it { is_expected.to route('chusen') }
  it { is_expected.to route('tyusen') }
end
