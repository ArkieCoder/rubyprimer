require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return a hash" do
    expect(result).to be_a(Hash)
  end

  it "should have correct keys and values" do
    expect(result).to eq({"Ramen" => 3, "Dal Makhani" => 4, "Tea" => 2})
  end
end