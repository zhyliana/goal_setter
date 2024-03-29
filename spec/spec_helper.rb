# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  # config.order = "random"
  config.include FactoryGirl::Syntax::Methods

end
def sign_up
  visit new_user_url
  fill_in 'Username', :with => "test"
  fill_in 'Password', :with => "123"
  click_on "Sign Up"
end

def sign_up_friend
  visit new_user_url
  fill_in 'Username', :with => "friend"
  fill_in 'Password', :with => "123"
  click_on "Sign Up"

end

def sign_up_buddy
  visit new_user_url
  fill_in 'Username', :with => "buddy"
  fill_in 'Password', :with => "123"
  click_on "Sign Up"

end

def sign_in
  visit new_session_url
  fill_in 'Username', :with => "test"
  fill_in 'Password', :with => "123"
  click_on "Sign In"
end

def create_goal(share_setting)
  click_link "Create Goal"
  fill_in('Title', with: "Finish Rails #{share_setting}")
  choose(share_setting)
  click_button "Create"
end


