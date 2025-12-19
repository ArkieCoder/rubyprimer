require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:result) { eval(code) }

  it "should return 3" do
    expect(result).to eq(3)
  end
end