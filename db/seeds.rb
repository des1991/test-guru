# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(
  name: 'Admin',
  login: 'admin',
  password: 'admin_password'
)

guest = User.create(
  name: 'Guest',
  login: 'guest',
  password: 'guest_password'
)

user = User.create(
  name: 'User',
  login: 'user',
  password: 'user_password'
)

categories = Category.create(title: 'Liverpool FC')

tests = Test.create([
  { title: 'История', level: 1, category_id: categories.id, user_id: admin.id },
  { title: 'Символика', level: 2, category_id: categories.id, user_id: admin.id }
])

questions = Question.create([
  { body: 'Дата основания', test_id: tests[0].id },
  { body: 'Основатель', test_id: tests[0].id },
  { body: 'Герб клуба', test_id: tests[1].id },
  { body: 'Цвет формы', test_id: tests[1 ].id },
])

answers = Answer.create([
  { body: '1892', question_id: 0, correct: true },
  { body: '1793', question_id: 0, correct: false },
  { body: '1854', question_id: 0, correct: false },
  { body: '1799', question_id: 0, correct: false },
  { body: 'Дикси Дин', question_id: 1, correct: false },
  { body: 'Бил Шенкли', question_id: 1, correct: false },
  { body: 'Джон Хоулдинг', question_id: 1, correct: true },
  { body: 'Джон Оррел', question_id: 1, correct: false },
  { body: 'Река Мерси', question_id: 2, correct: false },
  { body: 'Стадион Энфилд', question_id: 2, correct: false },
  { body: 'Ворота Шенкли', question_id: 2, correct: false },
  { body: 'Птица Лайвер', question_id: 2, correct: true },
  { body: 'Синий', question_id: 3, correct: false },
  { body: 'Красный', question_id: 3, correct: true },
  { body: 'Белый', question_id: 3, correct: false },
  { body: 'Черный', question_id: 3, correct: false }
])

TestsUser.create([
  { test_id: tests[0].id, user_id: guest.id },
  { test_id: tests[1].id, user_id: user.id }
])

categories = Category.create(title: 'Manchester United FC')

tests = Test.create([
  { title: 'Стадион', level: 1, category_id: categories.id, user_id: admin.id },
  { title: 'Болельщики', level: 2, category_id: categories.id, user_id: admin.id }
])

questions = Question.create([
  { body: 'Название стадиона', test_id: tests[0].id },
  { body: 'Крупнейшее объедение болельщиков', test_id: tests[1].id },
])

answers = Answer.create([
  { body: 'Олд Траффорд', question_id: 0, correct: true },
  { body: 'Энфилд', question_id: 0, correct: false },
  { body: 'Этихад стэдиум', question_id: 0, correct: false },
  { body: 'Уэмбли', question_id: 0, correct: false },
  { body: 'Красные дьяволы', question_id: 1, correct: false },
  { body: 'Манчестер Юнайтед скуад', question_id: 1, correct: false },
  { body: 'Независимая ассоциация болельщиков Манчестер Юнайтед', question_id: 1, correct: true },
  { body: 'Юнайтед оф Манчестер', question_id: 1, correct: false }
])
