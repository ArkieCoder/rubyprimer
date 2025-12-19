require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return an array" do
    expect(result).to be_a(Array)
  end

  it "should contain the keys" do
    expect(result.sort).to eq(["Coffee", "Dal Makhani", "Ramen"])
  end
end