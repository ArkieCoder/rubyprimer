require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return a hash" do
    expect(result).to be_a(Hash)
  end

  it "should have increased prices" do
    expect(result).to eq({"Ramen" => 3.3, "Dal Makhani" => 4.4, "Coffee" => 2.2})
  end
end