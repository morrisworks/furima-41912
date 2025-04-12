FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'example0'}
    password_confirmation {password}
    last_name             {'姓'}
    first_name            {'名'}
    last_name_kana        {'セイ'}
    first_name_kana       {'メイ'}
    birth_date            {Date.new(2000, 1, 1)}
  end
end