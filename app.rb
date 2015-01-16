require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require("./lib/contact")
require("./lib/phone")

get('/') do
  @contacts = Contact.all()
  @contacts_names = Contact.all_contact_names()
  erb(:index)
end

post('/contact') do
  name_to_add = params.fetch("name")
  number_to_add = params.fetch("number")
  type_to_add = params.fetch("type")
  phone_to_add = Phone.new({:number => number_to_add, :type => type_to_add})
  contact_to_add = Contact.new({:name => name_to_add, :phone => phone_to_add})
  contact_to_add.save()
  @contacts_names = Contact.all_contact_names()
  @contacts = Contact.all()
  erb(:index)
end
