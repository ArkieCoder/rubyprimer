require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }

  it "should return '0' for 0" do
    result = eval("#{code}; check_sign(0)")
    expect(result).to eq("0")
  end

  it "should return '5 is positive' for 5" do
    result = eval("#{code}; check_sign(5)")
    expect(result).to eq("5 is positive")
  end

  it "should return '-3 is negative' for -3" do
    result = eval("#{code}; check_sign(-3)")
    expect(result).to eq("-3 is negative")
  end
end