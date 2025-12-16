require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }

  it "should return true when name is 'Bob'" do
    result = eval("name = 'Bob'; #{code}")
    expect(result).to eq(true)
  end

  it "should return false when name is 'Sue'" do
    result = eval("name = 'Sue'; #{code}")
    expect(result).to eq(false)
  end
end
