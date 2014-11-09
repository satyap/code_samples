FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "User #{n}"}
  end

  factory :organization do
    sequence(:name) {|n| "Org #{n}"}
  end
end
