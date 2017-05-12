require 'rspec'
require 'date'

describe "example code" do
    let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

    it "should equal the length of RubyMonk" do
        expect(output.to_i).to eq("RubyMonk".length)
    end
end
