require 'rspec'

describe "example code" do
  let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

  it "should be a string" do
    expect(output.is_a?(String)).to be(true)
  end

  it "should equal 'ring\\nring\\nring'" do
    expect(output).to eq("ring\nring\nring")
  end
end