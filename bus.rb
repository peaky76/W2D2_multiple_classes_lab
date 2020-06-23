class Bus

    attr_reader :route, :destination

    def initialize(route, destination)
        @route = route
        @destination = destination
    end

    def drive()
        return "Vroom vroom!"
    end
    
end