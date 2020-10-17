# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dave = User.create!(
  username: 'dave'
)

john = User.create!(
  username: 'john'
)

kalvin = User.create!(
  username: 'kalvin'
)

software_engineering = Poll.create!(
  title: 'Poll on software engineering',
  user_id: dave.id
)

q_one = Question.create!(
  question: 'Best programming language paradigm, in opinion is',
  poll_id: software_engineering.id
)

ans_one = AnswerChoice.create!(
  choice: 'Object Oriented Programming',
  question_id: q_one.id
)

ans_two = AnswerChoice.create!(
  choice: 'Functional Programming',
  question_id: q_one.id
)

ans_thr = AnswerChoice.create!(
  choice: 'Procedural Programming',
  question_id: q_one.id
)

res_one = Response.create!(
  user_id: john.id,
  answer_choice_id: ans_one.id
)

res_two = Response.create!(
  user_id: kalvin.id,
  answer_choice_id: ans_two.id
)
