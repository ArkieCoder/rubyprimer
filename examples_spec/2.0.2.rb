require 'rspec'

describe "example code" do
  let(:code) { File.read('__TMPFILE__') }

  it "should return true when age is 23 and name is 'Bob'" do
    result = eval("age = 23; name = 'Bob'; #{code}")
    expect(result).to eq(true)
  end

  it "should return true when age is 23 and name is 'Jill'" do
    result = eval("age = 23; name = 'Jill'; #{code}")
    expect(result).to eq(true)
  end

  it "should return false when age is 23 and name is 'Frank'" do
    result = eval("age = 23; name = 'Frank'; #{code}")
    expect(result).to eq(false)
  end

  it "should return false when age is 20 and name is 'Bob'" do
    result = eval("age = 20; name = 'Bob'; #{code}")
    expect(result).to eq(false)
  end

  it "should return false when age is 20 and name is 'Jill'" do
    result = eval("age = 20; name = 'Jill'; #{code}")
    expect(result).to eq(false)
  end

  it "should return true when age is 50 and name is 'Bob'" do
    result = eval("age = 50; name = 'Bob'; #{code}")
    expect(result).to eq(true)
  end

  it "should return true when age is 50 and name is 'Jill'" do
    result = eval("age = 50; name = 'Jill'; #{code}")
    expect(result).to eq(true)
  end

  it "should return false when age is 50 and name is 'Frank'" do
    result = eval("age = 50; name = 'Frank'; #{code}")
    expect(result).to eq(false)
  end
end