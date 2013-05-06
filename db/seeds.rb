puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
  { :name => 'VIP' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'User1', :email => 'user@example.com', :password => 'pleaseme', :password_confirmation => 'pleaseme'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'User2', :email => 'user2@example.com', :password => 'pleaseme', :password_confirmation => 'pleaseme'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :user