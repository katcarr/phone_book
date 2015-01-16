class Contact

  attr_reader(:name, :number)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @name = @name.split('')
    @name.at(0).upcase!()
    @name = @name.join('')
    @number = attributes.fetch(:number)
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:search_contact) do |search_for_name|
    @@contacts.each() do |contact|
      if contact.name().downcase() == search_for_name.downcase()
        return contact
      end
    end
  end

  define_singleton_method(:all_contact_names) do
    all_names = []
    @@contacts.each do |contact|
      all_names.push(contact.name())
    end
    all_names.sort()
  end

end
