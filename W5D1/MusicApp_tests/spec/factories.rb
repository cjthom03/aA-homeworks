# Typical factory setup

# FactoryBot.define do
#   factory :post do
#     title 'It\'s a title!'
#     subtitle '~also has a subtitle~'
#     random_num { 1 + rand(100) }
#
#     # Child of :post factory, since it's in the `factory :post` block
#     factory :published_post do
#       published true
#     end
#   end
# end


FactoryBot.define do
  factory :user do
    email 'charlie@charlie.com'
    password 'charlie'
    session_token 'temporary_token'
  end
end
