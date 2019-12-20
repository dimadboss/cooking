# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#if Rails.env.development?
  AdminUser.delete_all
  Product.delete_all
  User.delete_all
  Recipe.delete_all
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  measure1 = Measure.create(munit: 'ml', capacity: '0.000001')
  measure2 = Measure.create(munit: 'litre', capacity: '0.001')
  product1 = Product.create(name: 'coffee')
  product2 = Product.create(name: 'milk')
  user1 = User.create(login: 'dima', password: 'password', email: 'test@ya.ru')
  recipe1 = Recipe.create(user: user1, title: 'Кофе с молоком', description: 'Смешать кофе и молоко')
  product_recipe1 = ProductRecipe.create(product: product1, recipe: recipe1, quantity: '0.1', measure: measure2)
  product_recipe1 = ProductRecipe.create(product: product2, recipe: recipe1, quantity: '60', measure: measure1)
#end

