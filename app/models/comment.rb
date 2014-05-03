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

class Comment < ActiveRecord::Base
  validates :body, :author, presence: true
  belongs_to :author, foreign_key: :user_id, class_name: "User"
  belongs_to :com_user, polymorphic: true
end
