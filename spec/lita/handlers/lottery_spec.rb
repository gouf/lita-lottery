require "spec_helper"

ENV['CSV_USER_NAMES'] = 'foo,bar,brabra'

describe Lita::Handlers::Lottery, lita_handler: true do
  it { is_expected.to route('lottery') }
  it { is_expected.to route('chusen') }
  it { is_expected.to route('tyusen') }

  let(:source) { ::Lita::Source.new(user: user)  }
  let(:user) { ::Lita::User.create("1", name: "foo")  }

  it 'response user name' do
    send_message('lottery')
    expect(replies.last).to match(/(bar)|(brabra)/)
  end

  it 'sender has not chosen' do
    1_000.times do
      send_message('lottery')
      expect(replies.last).not_to match 'foo'
    end
  end
end
