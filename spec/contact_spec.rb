require('rspec')
require('contact')
require('phone')

describe("Contact") do

  before() do
    Contact.clear()
  end

  describe("#initialize") do
    it("creates a contact object and capitlizes the first letter of the first name") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "ben carr", :phone => test_phone})
      expect(test_contact.name).to(eq("Ben carr"))
    end
  end


  describe("#name") do
    it("reads out the name in the contact") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      expect(test_contact.name).to(eq("Ben Carr"))
    end
  end

  describe("#phone") do
    it("reads out the phone object in the contact") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      expect(test_contact.phone).to(eq(test_phone))
    end
  end

  describe("#save") do
    it("saves itself (the conatact) to the class array of contact objects") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("returns all contact instances in the Contact class") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("returns all contact instances in the Contact class") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "503-777-7777", :type => "work"})
      test_contact2 = Contact.new({:name => "Amber King", :phone => test_phone2})
      test_contact2.save()
      expect(Contact.all()).to(eq([test_contact, test_contact2]))
    end
  end

  describe(".clear") do
    it("clears all contacts in the Contact class") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "503-777-7777", :type => "work"})
      test_contact2 = Contact.new({:name => "Amber King", :phone => test_phone2})
      test_contact2.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".search_contact") do
    it("returns the contact object that matches the name searched for") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "503-777-7777", :type => "work"})
      test_contact2 = Contact.new({:name => "Amber King", :phone => test_phone2})
      test_contact2.save()
      expect(Contact.search_contact("Ben Carr")).to(eq(test_contact))
    end
  end

  describe(".search_contact") do
    it("returns the conatact object that matches the name searched for despite
        letter case") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "503-777-7777", :type => "work"})
      test_contact2 = Contact.new({:name => "Amber king", :phone => test_phone2})
      test_contact2.save()
      expect(Contact.search_contact("Amber KING")).to(eq(test_contact2))
    end
  end

  describe(".all_contact_names") do

    it("returns an array of string with all the names for each contact instense
        in the Contact class") do
        test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
        test_contact = Contact.new({:name => "Alison Carr", :phone => test_phone})
        test_contact.save()
        test_phone2 = Phone.new({:number => "503-777-7777", :type => "work"})
        test_contact2 = Contact.new({:name => "Amber King", :phone => test_phone2})
        test_contact2.save()
        expect(Contact.all_contact_names()).to(eq(["Alison Carr", "Amber King"]))
    end

    it("returns an array of string with all the names for each contact instense
    in the Contact class in alphabetical order by first name") do
      test_phone = Phone.new({:number => "503-555-5555", type: "mobile"})
      test_contact = Contact.new({:name => "Ben Carr", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "503-777-7777", :type => "work"})
      test_contact2 = Contact.new({:name => "Amber King", :phone => test_phone2})
      test_contact2.save()
      expect(Contact.all_contact_names()).to(eq(["Amber King", "Ben Carr"]))
    end
  end

end
