require("minitest/autorun")
require("minitest/reporters")

require_relative("../person.rb")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PersonTest < MiniTest::Test

    def setup()
        @person = Person.new("Robert", 43)
    end

    def test_has_name()
        assert_equal("Robert", @person.name())
    end

    def test_has_age()
        assert_equal(43, @person.age())
    end
    
end