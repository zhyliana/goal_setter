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

require 'spec_helper'

describe Goal do
  subject(:goal) {build(:goal)}

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
    it { should ensure_inclusion_of(:privacy).in_array(["Private", "Public"]) }
    it { should ensure_inclusion_of(:completion).in_array([true, false]) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end
