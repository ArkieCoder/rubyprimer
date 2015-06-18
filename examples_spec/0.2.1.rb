require 'rspec'

describe "example code" do
    let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

    it "should evaluate to seven" do
        expect(output).to eq("7")
    end 
end
