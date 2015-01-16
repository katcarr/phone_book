require('rspec')
require('contact')

describe("Contact") do

  before() do
    Contact.clear()
  end

  describe("#name") do
    it("reads out the name in the contact") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-555"})
      expect(test_contact.name).to(eq("Ben Carr"))
    end
  end

  describe("#number") do
    it("reads out the number in the contact") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      expect(test_contact.number).to(eq("503-555-5555"))
    end
  end

  describe("#save") do
    it("saves itself (the conatact) to the class array of contact objects") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("returns all contact instances in the Contact class") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("returns all contact instances in the Contact class") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      test_contact2 = Contact.new({:name => "Amber King", :number => "503-777-7777"})
      test_contact2.save()
      expect(Contact.all()).to(eq([test_contact, test_contact2]))
    end
  end

  describe(".clear") do
    it("clears all contacts in the Contact class") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".search_contact") do
    it("returns the conatact object that matches the name searched for") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      test_contact2 = Contact.new({:name => "Amber King", :number => "503-777-7777"})
      test_contact2.save()
      expect(Contact.search_contact("Ben Carr")).to(eq(test_contact))
    end
  end

  describe(".search_contact") do
    it("returns the conatact object that matches the name searched for despite letter case") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      test_contact2 = Contact.new({:name => "Amber king", :number => "503-777-7777"})
      test_contact2.save()
      expect(Contact.search_contact("Amber KING")).to(eq(test_contact2))
    end
  end

end
