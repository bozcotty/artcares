u = User.new(
  email: 'jaime@hola.com',
  password: '12345678',
  password_confirmation: '12345678',
  first_name: 'jaime',
  last_name: 'smith',
  street_address: '132 jsdhkahsd',
  unit_number: '8',
  city: 'Seattle',
  state: 'WA',
  zip_code: '98102',
  phone_number: '2066542377',
  art_website: 'www.jaime.com',
  type_of_artist: 'Painter',
  artist_statement: 'xxx')

u.skip_confirmation!
u.save

puts "#{User.count} users created"
