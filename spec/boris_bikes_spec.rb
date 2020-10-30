require 'boris_bikes'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it "it releases the bike" do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      bike = docking_station.release_bike
      expect(bike).to be_a_kind_of(Bike)
    end

    it "checks bike is working" do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      bike = docking_station.release_bike
      expect(bike.working?).to eq true
    end

    it "throws an error when release_bike when dock is empty" do
      docking_station = DockingStation.new
      expect { docking_station.release_bike }.to raise_error("No bikes available")
    end

  end

  describe 'the #dock method' do
    it "puts bike in the DockingStation" do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.rack).to include(bike)
    end
  end
end

# when DockingStation.new then bike.release_bike(bike.working?)
