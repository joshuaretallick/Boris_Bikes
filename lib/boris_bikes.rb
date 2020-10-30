# Created a class called DockingStation
class DockingStation

### what is this doing? This is making @rack available in all
# of the methods?
  attr_reader :rack

# here we are creating or 'initializing' our rack array to
# store our bikes
  def initialize
# We create the array called @rack
    @rack = []
  end

# here we are defining a method called release_bike
  def release_bike
# the method will 'raise' an exception stating no bikes, if
# the @rack array is empty
    raise "No bikes available" if @rack.empty?
# Otherwise by implicit return it will instantiate a new Bike
    Bike.new
  end

# here we are defining a method called dock and passing it a
# parameter called bike
  def dock(bike)
# the bike variable created via our Bike class is pushed to be stored
# in the @rack array ### more info needed
    @rack << bike
  end


end
