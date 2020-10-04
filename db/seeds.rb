# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
    User.create(
        {
           name: Faker::Games::SuperSmashBros.fighter,
           avatar_url: Faker::Avatar.image,
           email: Faker::Internet.email,
           password: '123123',
        }
    )
end

100.times do
    user = rand(1..50)
    Tweet.create(
        {
            content: Faker::Games::LeagueOfLegends.quote,
            user_id: user
        }
    )
end