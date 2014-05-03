# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  body          :string(255)      not null
#  user_id       :integer          not null
#  com_user_type :string(255)      not null
#  com_user_id   :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body "MyString"
    author_id 1
    com_user_type "MyString"
    com_user_id 1
  end
end
