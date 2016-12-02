RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# https://read.codaisseur.com/topics/day-10-rails-testing/articles/02-fixtures-and-factories

# Enable the autoloading of the support directory by uncommenting the following line in your spec/rails_helper.rb:
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
