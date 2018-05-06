# == Schema Information
#
# Table name: books
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  author     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
end
