
class Player

    attr_reader :name
    attr_accessor :score

    def initialize(name)
        @name = name
        @score = 0
    end

    def get_input
        print "#{@name} Enter your guess: "
        input = gets.chomp
        pos = input.split(" ")
        pos.map! { |ele| ele.to_i }
    end
    
end