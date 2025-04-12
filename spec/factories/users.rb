FactoryBot.define do
  password_generator = -> {
    loop do
      password = Faker::Internet.password(min_length: 6)
      # 英字と数字で構成されているかを正規表現でチェック
      if password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
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