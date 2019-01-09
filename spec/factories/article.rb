FactoryBot.define do
  factory :article do
    title { Faker::Cat.registry }
    author  { Faker::Cat.name }
    text { Faker::Lorem.paragraph }
    image { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'mobile.jpg'), 'image/png') }
  end
end