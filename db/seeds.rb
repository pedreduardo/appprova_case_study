# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Create default admin'

Admin.create!(
  name: 'Administrador Geral',
  email: 'admin@admin',
  password: '123456',
  password_confirmation: '123456',
  role: 0
)

puts 'Admin created successful'

puts 'Create default member'

Member.create!(
  first_name: 'Renan',
  last_name: 'Garcia',
  cell_phone: '(31) 98500-0875',
  name_school: 'Approvado - Sem escola',
  cnpj_school: '82.292.155/0001-03',
  email: 'member@member',
  password: '123456',
  password_confirmation: '123456'
)

puts 'Member created successful'
