require 'rspec'

describe "example code" do
  let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

  it "should be a string" do
    expect(output.is_a?(String)).to be(true)
  end

  it "should equal 'this is mixed case'" do
    expect(output).to eq("this is mixed case")
  end
end