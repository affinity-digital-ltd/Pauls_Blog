FactoryBot.define do
  factory :comment do
    author_name { Faker::Cat.name }
    body { Faker::Lorem.paragraph }
  end
end