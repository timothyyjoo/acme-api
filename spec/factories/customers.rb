FactoryBot.define do
  factory :customer do
    first_name "Jim"
    last_name "Jones"
    address "MyString"
    city "Modesto"
    state "CA"
    zip 1
    token "12345"
  end
end
