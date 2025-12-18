require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return an integer" do
    expect(result).to be_a(Integer)
  end

  it "should equal 5" do
    expect(result).to eq(5)
  end
end