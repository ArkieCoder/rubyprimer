require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return an array" do
    expect(result).to be_a(Array)
  end

  it "should equal [3, 6, 9, 12, 15]" do
    expect(result).to eq([3, 6, 9, 12, 15])
  end
end