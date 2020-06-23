class BusStop

    attr_reader :name
    
    def initialize(name)
        @name = name
        @queue = []
    end

    def queue_length()
        return @queue.length()
    end

    def add_person(person)
        @queue << person
    end
    
end