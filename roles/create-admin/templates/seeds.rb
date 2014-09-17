
admin_person= Person.find_or_create_by pseudonym: 'Admin'

admin_user= User.find_or_initialize_by login: 'admin'

admin_user.update_attributes! \
  password: '{{admin_password}}', 
  email: 'admin@somewhere',
  person: admin_person

AdminUser.find_or_create_by user_id: admin_user.id


