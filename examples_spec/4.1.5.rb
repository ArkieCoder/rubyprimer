require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return a hash" do
    expect(result).to be_a(Hash)
  end

  it "should have correct key-value pairs" do
    expect(result).to eq({:punch => 0, :kick => 72, :stops_bullets_with_hands => false})
  end
end