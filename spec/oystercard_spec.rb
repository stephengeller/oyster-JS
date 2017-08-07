require 'oystercard'

describe Oystercard do
  subject { described_class.new }

  it 'is initialized with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'default max balance is 90' do
    expect(subject.max_balance).to eq(90)
  end

  it 'tops up' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  
  it 'balance has been topped up with 5' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it 'raises an error when you try to top your balance to above a maximum balance of 90' do
    expect { subject.top_up(100) }.to raise_error 'unable to top up as balance would exceed maximum of £90'
  end

  it 'balance has been reduced by 5' do
    subject.balance = 20
    subject.deduct(5)
    expect(subject.balance).to eq(15)
  end

  it 'is in journey' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'shows message not in journey when card not in use' do
    expect(subject.in_journey?).to eq "Card not in use on journey"
  end
  
  it 'shows message in journey when card in use' do
    subject.touch_in
    expect(subject.in_journey?).to eq "Card in use on journey"
  end
  
  it 'is touched in' do
    expect(subject.touch_in).to eq true
  end
  
  it 'is not touched in' do
    expect(subject.touch_out).to eq false
  end
  
  it 'default use status is that card is not in use' do
    expect(subject.in_use).to eq false
  end

end
