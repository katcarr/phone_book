class Contact

  attr_reader(:name, :number)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
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

end
