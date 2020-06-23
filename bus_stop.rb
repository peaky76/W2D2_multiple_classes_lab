class BusStop

    attr_reader :name, :queue
    
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

    def empty_queue()
        @queue.clear()
    end
    
end