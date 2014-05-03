# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)      not null
#  password      :string(255)      not null
#  session_token :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, :presence => true
  validates :username, uniqueness: true
  before_validation :ensure_session_token

  has_many :goals, inverse_of: :user
  has_many :authored_comments, class_name: "Comment", inverse_of: :author #comments user wrote
  has_many :comments, as: :com_user #comments people leave on profile


  def reset_session_token!
    self.session_token = SecureRandom.hex
    self.save!

    self.session_token
  end

  def public_goals
    self.goals.where(privacy: "Public")
  end

  def self.find_by_credentials(user_name, raw_password)
    User.find_by(username: user_name, password: raw_password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.hex
  end

end
