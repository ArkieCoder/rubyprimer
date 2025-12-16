require 'rspec'

describe "example code" do
  let(:result) do
    code = File.read('__TMPFILE__')
    eval("def test_method; #{code}; end")
    test_method
  end

  it "should be an array" do
    expect(result).to be_a(Array)
  end

  it "should equal the expected array" do
    expect(result).to eq(["Fear", "is", "the", "path", "to", "the", "dark", "side"])
  end
end