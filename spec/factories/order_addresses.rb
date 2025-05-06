FactoryBot.define do

  postal_code_generator = -> {
      postal_code3 = Faker::Number.number(digits: 3)
      postal_code4 = Faker::Number.number(digits: 4)
      postal_code = "#{postal_code3}-#{postal_code4}"
       return postal_code 
  }

  phone_number_generator = -> {
    length = [10, 11].sample # 10か11のどちらかをランダムに選ぶ
    Faker::Number.number(digits: length)
  }

  factory :order_address do
    postal_code      {postal_code_generator.call}
    prefecture_id    {Faker::Number.within(range: 2..48) }
    city             {Faker::Address.city}
    address          {Faker::Address.street_address}
    building         {Faker::Address.building_number}
    phone_number     {phone_number_generator.call}
    token            {"tok_abcdefghijk00000000000000000"}

  end
end
