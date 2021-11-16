# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  User.create(name:"Takumi Hamamoto",
    email:"1213@email.com",
    password:"password",
    password_confirmation:"password" ,
    admin: true
    )
  
  99.times do |n|
    name = Faker::Games::Pokemon.name
    email = "username#{n + 1}@email.com"
    password = "password"
    User.create(
      name:name,
      email: email,
      password: password,
      password_confirmation:password,
      admin:false
      )
  end

  50.times do |n|
    title = Faker::Games::Pokemon.name
    description = Faker::Games::Zelda.location #=> "Tarrey Town"
    Category.create(
      title: title,
      description: description,
      )
  end


  categories = Category.order(:created_at).take(3)

  5.times do |n|
    word = Faker::JapaneseMedia::OnePiece.character
    choice1 = Faker::JapaneseMedia::OnePiece.island
    choice2 = Faker::JapaneseMedia::OnePiece.island
    choice3 = Faker::JapaneseMedia::OnePiece.island
    
    categories.each { |category| category.words.create!(
      word: word,
      :choices_attributes =>
      {
        0 =>{
          choice: choice1,
          correct: true
        },
        1 =>{
          choice: choice2,
          correct: false
        },
        2 =>{
          choice: choice3,
          correct: false
        }
      }
    )
  }
  end

