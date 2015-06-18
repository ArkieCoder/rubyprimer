require 'rspec'

describe "example code" do
    let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

    it "should check if two is between one and three" do
        expect(eval(output)).to eq(2.between?(1,3))
    end 
end
