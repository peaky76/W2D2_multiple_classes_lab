require("minitest/autorun")
require("minitest/reporters")

require_relative("../bus.rb")
require_relative("../bus_stop.rb")
require_relative("../person.rb")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BusTest < MiniTest::Test

    def setup()
        @bus = Bus.new(22, "Ocean Terminal")
        @bus_stop = BusStop.new("Stop 10")
        @passenger_1 = Person.new("Mavis", 70)
        @passenger_2 = Person.new("Dave", 35)
        @passenger_3 = Person.new("Ali", 53)
    end

    def test_has_route()
        assert_equal(22, @bus.route)
    end

    def test_has_destination()
        assert_equal("Ocean Terminal", @bus.destination)
    end

    def test_starts_with_zero_passengers()
        assert_equal(0, @bus.passenger_count())
    end

    def test_drive()
        assert_equal("Vroom vroom!", @bus.drive())
    end

    def test_pick_up()
        @bus.pick_up(@passenger_1)
        assert_equal(1, @bus.passenger_count())
    end

    def test_drop_off()
        @bus.pick_up(@passenger_1)
        @bus.drop_off(@passenger_1)
        assert_equal(0, @bus.passenger_count())
    end

    def test_empty()
        @bus.pick_up(@passenger_1)
        @bus.pick_up(@passenger_2)
        @bus.empty()
        assert_equal(0, @bus.passenger_count())
    end

    def test_pick_up_from_stop()
        # Add passengers to stop
        @bus_stop.add_person(@passenger_1)
        @bus_stop.add_person(@passenger_2)
        @bus_stop.add_person(@passenger_3)
        # Bus pick up passengers
        @bus.pick_up_from_stop(@bus_stop)
        # Bus has 3 passengers
        assert_equal(3, @bus.passenger_count())
        # Stop queue is empty
        assert_equal(0, @bus_stop.queue.length())
    end

    def test_bus_breakdown()
        @bus.pick_up(@passenger_1)
        @bus.pick_up(@passenger_2)
        @bus.pick_up(@passenger_3)
        @bus.breakdown()
        assert_equal(0, @bus.passenger_count())
    end
    
end
