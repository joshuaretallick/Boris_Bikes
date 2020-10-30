# Here we are telling 'boris_bikes_spec.rb' that it will need or 'require'
# the 'boris_bikes.rb' file to run correctly
require 'boris_bikes'
# This test title is saying, what is the DockingStation class doing?
describe DockingStation do
# The test in English is saying when we run this test
# That we are expecting the DockingStation class to respond to release_bike
# It recieves two responses, raise an error if it can't release_bike or
# instantiate a new Bike (responds with a hexidecimal 'bike')
  it { is_expected.to respond_to :release_bike }

# The following test is indented as it is a part of the DockingStation class
# The test title is saying, what does release_bike actually do?
  describe '#release_bike' do
# Here is reverted to long syntax to Rspec rather than one liner as it is much
# easier to read
# The test result 'string' is it will release the bike, pending a passing test
    it "it releases the bike" do
# The test requires that we create a new docking_station
      docking_station = DockingStation.new
# we create a new instance of a bike in the 'dock' to run the test
      docking_station.dock(Bike.new)
# the docking_station releases the bike
      bike = docking_station.release_bike
# the test expects the bike variable above to be a Bike ### I need more info
      expect(bike).to be_a_kind_of(Bike)
    end

# The test result 'string' is it will check the bike is working,
# pending a passing test & is part of the release_bike function
    it "checks bike is working" do
# The test requires that we create a new docking_station
      docking_station = DockingStation.new
# we create a new instance of a bike in the 'dock' to run the test
      docking_station.dock(Bike.new)
# the docking_station releases the bike
      bike = docking_station.release_bike
# the test is running the 'working' method in the Bike class with a Hardcoded
# result of 'true' ### I need more info, how is it communicating?
      expect(bike.working?).to eq true
    end

# The test result 'string' is it will error if there are no bikes pending
# a passing test, also a part of the release_bike function
    it "throws an error when release_bike when dock is empty" do
# The test requires that we create a new docking_station
      docking_station = DockingStation.new
# The test expects when we run the release_bike method  that it will raise
# an error and return that 'no bikes are available'
      expect { docking_station.release_bike }.to raise_error("No bikes available")
    end

  end

# We are now out of the release_bike method above and testing what does the
# dock method actually do
  describe 'the #dock method' do
# It will return a message about putting the bike back in the docking_station
# pending a passing test
    it "puts bike in the DockingStation" do
# The test requires that we create a new docking_station
      docking_station = DockingStation.new
# We need to also create a new bike to return to the docking_station
      bike = Bike.new
# Here we are docking the bike variable above in the docking_station
      docking_station.dock(bike)
# The test expects after all of the above that the docking_station rack
# Will now have the bike above stored in it
      expect(docking_station.rack).to include(bike)
    end

# the test will throw an error if the user tries to dock a bike but the
# docking_station is at capacity
    it "throws an error when docking_station.dock is called and the docking station is at capacity" do
# The test requires that we create a new docking_station
      docking_station = DockingStation.new
# And the following test will add 21 bikes to the docking_station to
# throw the error
      expect { 21.times { docking_station.dock Bike.new } }.to raise_error("Dock at Capacity")
    end

    it "allows us to store 20 bikes without throwing an error" do
      docking_station = DockingStation.new
# Adding 20 bikes to docking_station & test is testing that the
#number of bikes has increased by 20
      expect { 20.times { docking_station.dock Bike.new } }.to change { docking_station.rack.length }.by(20)
    end

  end
end
