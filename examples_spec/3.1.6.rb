require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:context) { binding() }

  before { eval(code, context) }

  it "should have arr as an array" do
    expect(eval("arr", context)).to be_a(Array)
  end

  it "should have arr equal [1, 3, 5, 7, 9]" do
    expect(eval("arr", context)).to eq([1, 3, 5, 7, 9])
  end
end