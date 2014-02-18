require 'faker'

u = User.new(first_name: 'Scott', last_name: 'Hale', email: 'scotthale12@gmail.com', password: 'kayaks10', password_confirmation: 'kayaks10')
u.skip_confirmation!
u.save
