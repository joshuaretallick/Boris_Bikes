# Here I am 'requiring' or simply telling this spec
# that it needs bike.rb to run correctly
require 'bike'
# This test title is saying 'What is the Bike class doing?'
describe Bike do
# The actual test in english is saying
# When we run this test we are expecting the Bike class
# to respond with a message, in this case 'working?' will
# return 'true' as we hardcoded the response
  it { is_expected.to respond_to :working? }
end
