FactoryBot.define do
  factory :artist do
    name { Faker::Artist.name }
    image { Faker::Company.logo }
    popularity { Faker::Number.between(1, 100) }
    spotify_url { Faker::Internet.url }
    spotify_id { Faker::Code.isbn }
    genres { [Faker::Music.genre, Faker::Music.genre] }
  end
end
