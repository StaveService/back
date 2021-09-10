UserRelationship.seed(:id,
                      (1..2).map do |i|
                        FactoryBot.attributes_for(:user_relationship, id: i, followed: User.find(3),
                                                                      follower: User.find(i))
                      end)
