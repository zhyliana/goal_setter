# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  user_id    :integer          not null
#  privacy    :string(255)
#  completion :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :completion, inclusion: { in: [true, false] }
  validates :privacy, inclusion: { in: ["Public", "Private"] }

  belongs_to :user, inverse_of: :goals
end
