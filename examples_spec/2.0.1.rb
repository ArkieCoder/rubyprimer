require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }

  it "should return true when age is 12" do
    result = eval("age = 12; #{code}")
    expect(result).to eq(true)
  end

  it "should return true when age is 35" do
    result = eval("age = 35; #{code}")
    expect(result).to eq(true)
  end

  it "should return false when age is 36" do
    result = eval("age = 36; #{code}")
    expect(result).to eq(false)
  end
end
