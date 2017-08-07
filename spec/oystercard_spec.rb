require 'oystercard'

describe Oystercard do
  subject { described_class.new }

  it 'is initialized with a balance of 0' do
    expect(subject.balance).to eq(0)
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
    subject.deduct(5)
    expect(subject.balance).to eq 15
  end

end
