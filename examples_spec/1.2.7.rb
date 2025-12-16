require 'rspec'

describe "example code" do
  let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

  it "should be a string" do
    expect(output.is_a?(String)).to be(true)
  end

  it "should equal '0uby0onk 0s 0retty 0rilliant'" do
    expect(output).to eq("0uby0onk 0s 0retty 0rilliant")
  end
end