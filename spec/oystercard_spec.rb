require 'oystercard'

describe Oystercard do

  subject { described_class.new }

  it "is initialized with a balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "balance has been topped up with 5" do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

end
