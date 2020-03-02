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

Test.create!(title: 'RoR beginner', level: 0, author: User.first, category: Category.first)
Test.create!(title: 'RoR pro', level: 5, author: User.first, category:  Category.first)
Test.create!(title: 'Ruby pro', level: 5, author: User.first, category:  Category.first)
Test.create!(title: 'Car driving beginner', level: 1, author: User.first, category:  Category.second)
Test.create!(title: 'Car driving pro', level: 5, author: User.first, category:  Category.second)

Question.create!(body: 'Question 1 about something?', test: Test.first)
Question.create!(body: 'Question 2 about something?', test: Test.first)
Question.create!(body: 'Question 3 about something?', test: Test.first)
Question.create!(body: 'Question 4 about something?', test: Test.first)
Question.create!(body: 'Question 5 about something?', test: Test.first)
Question.create!(body: 'Question 6 about something?', test: Test.first)

Answer.create!(body: 'Answer 1', correct: true, question: Question.first)
Answer.create!(body: 'Answer 2', question: Question.second)
Answer.create!(body: 'Answer 3', question: Question.first)
Answer.create!(body: 'Answer 4', question: Question.second)
Answer.create!(body: 'Answer 5', question: Question.second)
Answer.create!(body: 'Answer 6', correct: true, question: Question.last)
Answer.create!(body: 'Answer 7', question: Question.first)
Answer.create!(body: 'Answer 8', question: Question.last)
Answer.create!(body: 'Answer 9', question: Question.last)

User.last.tests << Test.first
