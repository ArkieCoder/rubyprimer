require 'rspec'

describe "example code" do
    let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

    it "should be a string" do
        expect(output.is_a?(String)).to be(true)
    end 

    it "should equal 'RubyMonk'" do
        expect(output).to eq("RubyMonk")
    end
end
