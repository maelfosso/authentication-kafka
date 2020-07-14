# Load the Rails application.
require_relative 'application'
require Rails.root.join(Karafka.boot_file)

# Initialize the Rails application.
Rails.application.initialize!
