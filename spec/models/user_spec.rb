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

require 'spec_helper'

describe User do
  subject(:user) {build(:user)}

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end

  describe "associations" do
    it { should have_many(:comments) }
    it { should have_many(:goals) }
    it { should have_many(:authored_comments) }
  end
end
