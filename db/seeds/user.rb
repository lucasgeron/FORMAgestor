p User.create_with(password: 'admin', password_confirmation: 'admin', is_admin:  true, permit_login: true).find_or_create_by(email: 'admin@admin') 
