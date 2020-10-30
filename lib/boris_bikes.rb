class DockingStation

  attr_reader :rack

  def initialize
    @rack = []
  end

  def release_bike
    raise "No bikes available" if @rack.empty?
    Bike.new
  end

  def dock(bike)
    @rack << bike
  end


end
