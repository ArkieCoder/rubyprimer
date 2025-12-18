require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return an array" do
    expect(result).to be_a(Array)
  end

  it "should equal [4, 5, 6, 7]" do
    expect(result).to eq([4, 5, 6, 7])
  end
end