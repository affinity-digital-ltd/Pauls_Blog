FactoryBot.define do
  factory :article do
    title { Faker::Cat.registry }
    author  { Faker::Cat.name }
    text { Faker::Lorem.paragraph }

    transient do
      comments { 3 }
    end

    trait :with_comments do
      after(:create) do |article, evaluator|
        create_list(:comment, evaluator.comments, article: article)
      end
    end
  end
end