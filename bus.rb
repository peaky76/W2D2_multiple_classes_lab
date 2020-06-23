class Bus

    attr_reader :route, :destination

    def initialize(route, destination)
        @route = route
        @destination = destination
        @passengers = []
    end

    def drive()
        return "Vroom vroom!"
    end

    def passenger_count()
        return @passengers.count()
    end

    def pick_up(passenger)
        @passengers << passenger
    end
    
end