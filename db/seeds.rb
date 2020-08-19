# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 50.times do |n|
#   User.create(
#     email: "test#{n + 1}@example.com",
#     name: "テスト太郎#{n + 1}",
#     password: "foobar",
#     password_confirmation: "foobar"
#   )
# end

Tag.create([
  {name:'地震'},
  {name:'津波'},
  {name:'台風'},
  {name:'火災'},
  {name:'備え'},
  {name:'予防'},
  {name:'噴火'},
  {name:'災害対策'},
  {name:'準備'},
  {name:'感染症'},
  {name:'自宅'}
])