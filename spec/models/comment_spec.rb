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

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
