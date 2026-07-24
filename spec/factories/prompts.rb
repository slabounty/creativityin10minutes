FactoryBot.define do
  factory :prompt do
    title { "MyString" }
    instructions { "MyText" }
    category { "MyString" }
    active { false }
  end
end
