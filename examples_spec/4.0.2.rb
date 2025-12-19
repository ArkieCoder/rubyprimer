require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }
  let(:context) { binding() }

  before { eval(code, context) }

  it "should set restaurant_menu correctly" do
    expect(eval("restaurant_menu", context)).to be_a(Hash)
    expect(eval("restaurant_menu", context)).to eq({"Dal Makhani" => 4.5, "Tea" => 2})
  end
end