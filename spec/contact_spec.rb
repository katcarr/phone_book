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

  describe(".clear") do
    it("clears all contacts in the Contact class") do
      test_contact = Contact.new({:name => "Ben Carr", :number => "503-555-5555"})
      test_contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

end
