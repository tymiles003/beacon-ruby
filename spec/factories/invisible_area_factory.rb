FactoryGirl.define do
  factory :invisible_area do
    name 'Test Invisible Area'
    location 'Middle of Nowhere'
    latitude 10.0
    longitude 10.0
    range 50
    association :user, factory: :user
  end
end
