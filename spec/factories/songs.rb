FactoryBot.define do
  factory :song do
    name { Faker::Music.chord }
    preview_url { Faker::Company.logo }
    duration_ms { Faker::Number.between(1, 100) }
    explicit { Faker::Boolean.boolean }
    spotify_url { Faker::Internet.url }
    spotify_id { Faker::Code.isbn }
  end
end
