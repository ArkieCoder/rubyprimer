require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code + "; array_copy([1,2,3,4,5])") }

  it "should return an array" do
    expect(result).to be_a(Array)
  end

  it "should equal [1, 2, 3]" do
    expect(result).to eq([1, 2, 3])
  end
end