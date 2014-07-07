
admin_group= Group.find_or_create_by name: 'Admin'

admin_person= Person.find_or_create_by pseudonym: 'Admin'

admin_user= User.find_or_initialize_by login: 'admin'

admin_user.update_attributes! \
  password: '{{admin_password}}', 
  email: 'admin@somewhere',
  person: admin_person


admin_group.users << admin_user unless admin_group.users.include? admin_user

