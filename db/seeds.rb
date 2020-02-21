# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{name: "admin", password: "123", email: "admin@test)guru.ru"},
              {name: "user", password: "123", email: "user@test_guru.ry"}])
category = Category.create!(title: "Ruby")
test = Test.create!(title: "Ruby_base_test", level: 1, category: category, author: User.first)

question = Question.create!(test: test, body: "Generate an empty migration to make the posts table.")
Answer.create!(question: question, body: "rails generate migration CreatePosts", correct: true)
User.last.tests << Test.last
