require 'oystercard'

describe Oystercard do
  subject { described_class.new }
  let(:station) { double :station }
  let(:station_A) { double :station_A }
  let(:station_B) { double :station_B }
  let(:station_C) { double :station_C }
  let(:station_D) { double :station_D }

  it 'is initialized with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'default max balance is 90' do
    expect(subject.max_balance).to eq(90)
  end

  it 'balance has been topped up with 5' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it 'raises an error when you try to top your balance to above a maximum balance of 90' do
    expect { subject.top_up(100) }.to raise_error 'unable to top up as balance would exceed maximum of £90'
  end

  it 'balance has been reduced by 5' do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(5, station)
    expect(subject.balance).to eq(15)
  end

  it 'in_use status changes to true after touching in' do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it 'in_use status changes to false after touching out' do
    subject.top_up(5)
    subject.touch_in(station)
    subject.touch_out(1, station)
    expect(subject.in_journey?).to eq false
  end

  it 'default use status is that card is not in use' do
    expect(subject.in_journey?).to eq false
  end

  it 'raises an error when you try to touch in with 0 funds' do
    expect { subject.touch_in(station) }.to raise_error "You do not have enough money to travel"
  end

  it 'deducts 1 from balance after completing journey' do
    subject.top_up(5)
    subject.touch_in(station)
    expect { subject.touch_out(1, station) }.to change { subject.balance }.by(-1)
  end

  it 'records the station at which we touched in' do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.journey.entry_station).to eq station
  end

  it 'forgets the journey after touching out' do
    subject.top_up(5)
    subject.touch_in(station)
    subject.touch_out(1, station)
    expect(subject.journey).to eq nil
  end

  it 'has an empty trip history initially' do
    expect(subject.journeys).to eq []
  end

  it 'shows trip history' do
    subject.top_up(5)
    subject.touch_in(station_A)
    subject.touch_out(1, station_B)
    subject.touch_in(station_C)
    subject.touch_out(1, station_D)
    expect(subject.journeys[0].entry_station).to eq(station_A)
    expect(subject.journeys[0].exit_station).to eq(station_B)
    expect(subject.journeys[1].entry_station).to eq(station_C)
    expect(subject.journeys[1].exit_station).to eq(station_D)
  end
end
