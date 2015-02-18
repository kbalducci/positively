# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  user = User.create!(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    username: Faker::Internet.user_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password(8))
  10.times do
    user.glows.create(quote: Faker::Lorem.paragraph,
                      author: Faker::Name.name,
                      subject: Faker::Lorem.word)
  end
end
