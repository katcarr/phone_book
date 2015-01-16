require('rspec')
require('phone')

describe("Phone") do
  describe("#number") do
    it( "returns the phone type for the phone class instance") do
      test_phone = Phone.new({:number => "555-555-5555", :type => "mobile"})
      expect(test_phone.number()).to(eq("555-555-5555"))
    end
  end

  describe("#type") do
    it( "returns the phone type for the phone class instance") do
      test_phone = Phone.new({:number => 555-555-5555, :type => "mobile"})
      expect(test_phone.type()).to(eq("mobile"))
    end
  end

end
