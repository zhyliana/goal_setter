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
  pending "add some examples to (or delete) #{__FILE__}"
end
