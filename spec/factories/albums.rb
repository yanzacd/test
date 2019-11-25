FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    image { Faker::Company.logo }
    total_tracks { Faker::Number.between(1, 100) }
    spotify_url { Faker::Internet.url }
    spotify_id { Faker::Code.isbn }
  end
end
