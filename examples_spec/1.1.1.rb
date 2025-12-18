require 'rspec'

describe "example code" do
  let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

  it "should be a string" do
    expect(output.is_a?(String)).to be(true)
  end

  it "should equal 'The string you just gave me has a length of 5'" do
    expect(output).to eq("The string you just gave me has a length of 5")
  end
end