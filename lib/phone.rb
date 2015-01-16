class Phone

  attr_reader(:number, :type)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
  end

end
