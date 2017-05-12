require 'rspec'
require 'date'

describe "example code" do
    let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }

    it "should equal the current month" do
        expect(output).to eq(Date.today.strftime("%B"))
    end
end
