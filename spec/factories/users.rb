FactoryBot.define do
  password_generator = -> {
    loop do
      password = Faker::Internet.password(min_length: 6)
      # 英字と数字が両方含まれているかを正規表現でチェック
      if password.match(/(?=.*[a-zA-Z])(?=.*[0-9])/)
        break password
      end
    end
  }

  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {password_generator.call}
    password_confirmation {password}

    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    last_name_kana        {Faker::Japanese::Name.last_name.yomi}
    first_name_kana       {Faker::Japanese::Name.first_name.yomi}
    birth_date            {Faker::Date.between(from: 100.years.ago, to: Date.today)}
  end
end