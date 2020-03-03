# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{name: "admin", password: "123", email: "admin@test)guru.ru"},
              {name: "user", password: "123", email: "user@test_guru.ry"}])
categories_title = %w[Programming Driving Cooking]
categories = []
categories_title.each do |title|
  categories << Category.create!(title: title)
end

tests_data = [{title: 'RoR beginner', level: 0, author: users[0], category: categories[0]},
               {title: 'RoR pro', level: 5, author: users[0], category:  categories[0]},
               {title: 'Ruby pro', level: 5, author: users[0], category:  categories[0]},
              {title: 'Car driving beginner', level: 1, author: users[0], category:  categories[1]},
              {title: 'Car driving pro', level: 5, author: users[0], category:  categories[1]}]
tests = []
tests_data.each do |test_data|
  tests << Test.create!(test_data)
end

questions = []
question_number = 1
while question_number < 10 do
  questions << Question.create!(body: "Question #{question_number} about something?", test: tests[0])
  question_number += 1
end

questions.each do |question|
  answer_count = 1
  while answer_count < 4
    random_boolean = [true, false].sample
    Answer.create!(body: "Answer #{answer_count}", correct: random_boolean, question: question)
    answer_count += 1
  end
end

users[1].tests << tests[0]
