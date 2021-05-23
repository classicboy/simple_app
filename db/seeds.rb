puts 'CREATING Roles'
Role.create(Role::ROLES.map { |name| { name: name } })

puts 'CREATING Admin'
admin = User.new(email: 'admin@gmail.com', password: '111111111', name: 'Admin')
admin.add_role :admin
admin.save!

puts 'CREATING User'
User.create(email: 'user@gmail.com', password: '999999999', name: 'David')
