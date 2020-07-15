# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  [
    {subject:"国語", subject_content: "現代文"},
    {subject:"国語", subject_content: "古文"},
    {subject:"国語", subject_content: "漢文"},
    {subject:"数学", subject_content: "算数"},
    {subject:"数学", subject_content: "数学I"},
    {subject:"数学", subject_content: "数学A"},
    {subject:"数学", subject_content: "数学II"},
    {subject:"数学", subject_content: "数学B"},
    {subject:"数学", subject_content: "数学III"},
    {subject:"数学", subject_content: "数学C"},
    {subject:"社会", subject_content: "日本史"},
    {subject:"社会", subject_content: "世界史"},
    {subject:"社会", subject_content: "地理"},
    {subject:"理科", subject_content: "化学"},
    {subject:"理科", subject_content: "物理"},
    {subject:"理科", subject_content: "生物"},
    {subject:"英語", subject_content: "英語"}
  ]
)

# students #
Student.create!(
  name: "テストユーザー",
  email: "test0000@mail.com",
  password: "test0000",
  password_confirmation: "test0000",
  grade: Random.new.rand(1..13)
)
50.times do |n|
  Student.create!(
    name: "テストユーザー#{n}",
    email: "test#{n + 1}@mail.com",
    password: "test#{(n+1).to_s+(n+1).to_s}",
    password_confirmation: "test#{(n+1).to_s+(n+1).to_s}",
    grade: Random.new.rand(1..13)
  )
end

puts "初期データを登録しました"