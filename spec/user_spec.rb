require_relative '../user.rb'

describe User do
  let(:user) { User.new }
  it "get dictionary word for phone number" do
  	user.phone_number = "1-800-6686787825"
  	result = user.get_phone_number_word_combination.flatten
    expect(result).to include("mot,opt,puck")
    expect(result).to include("motor,truck")
  end

  it "should not give word for phone number" do 
  	user.phone_number = "23456789"
  	result = user.get_phone_number_word_combination
  	expect(result).to eq("Phone Number should contain 10 Digits")
  end

  it "should not give word for phone number which contails 1 or 0" do 
  	user.phone_number = "123456789"
  	result = user.get_phone_number_word_combination
  	expect(result).to eq("Not possible to convert this phone number")
  end
end
