# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{name: "admin", password: "123", email: "admin@test)guru.ru"},
              {name: "user", password: "123", email: "user@test_guru.ry"}])
categories_title = %w[Programming Driving Cooking]
categories_title.each do |title|
  Category.create!(title: title)
end

tests_data = [{title: 'RoR beginner', level: 0, author: User.first, category: Category.first},
               {title: 'RoR pro', level: 5, author: User.first, category:  Category.first},
               {title: 'Ruby pro', level: 5, author: User.first, category:  Category.first},
              {title: 'Car driving beginner', level: 1, author: User.first, category:  Category.second},
              {title: 'Car driving pro', level: 5, author: User.first, category:  Category.second}]

tests_data.each do |test_data|
  Test.create!(test_data)
end

question_number = 1
while question_number < 10 do
  Question.create!(body: "Question #{question_number} about something?", test: Test.first)
  question_number += 1
end

Question.find_each do |question|
  answer_count = 1
  while answer_count < 4
    random_boolean = [true, false].sample
    Answer.create!(body: "Answer #{answer_count}", correct: random_boolean, question: question)
    answer_count += 1
  end
end

User.last.tests << Test.first
