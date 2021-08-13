User.seed(:id,
          (1..2).map do |i|
            FactoryBot.attributes_for(:user, id: i)
          end)

User.seed(:id,
          { id: 3, email: 'test@test.com', familyname: 'test', givenname: 'tester', nickname: 'IamTester',
            password: 'password', password_confirmation: 'password' })
