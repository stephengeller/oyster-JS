require 'station'

describe Station do
  subject(:station) { described_class.new(:London_Bridge, 1) }
  it "knows it's name" do
    expect(subject.name).to eq :London_Bridge
  end
  it "knows it's zone" do
    expect(subject.zone).to eq 1
  end
end
