FactoryBot.define do
  factory :article do
    title { Faker::Cat.registry }
    author  { Faker::Cat.name }
    text { Faker::Lorem.paragraph }
  end
end