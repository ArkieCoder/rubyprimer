require 'rspec'

describe "example code" do
    let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

    it "results in 3" do
        expect(output).to eq("3")
    end 
end
