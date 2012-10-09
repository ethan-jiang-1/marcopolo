# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name "MyString"
    alt_name1 "MyString"
    alt_name2 "MyString"
    alt_name3 "MyString"
    latitude 1.5
    longitude 1.5
    place_category nil
    is_active false
  end
end
