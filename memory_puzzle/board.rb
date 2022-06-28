require "byebug"
require_relative 'card.rb'

class Board

    attr_reader :grid, :size

    def initialize(size)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, face_value)
        row, col = pos
        @grid[row][col] = face_value
    end

    def populate
        card_array = []
        while card_array.length < (@size * @size)
            card = Card.create_card
            if !card_array.include?(card)
                card_array << card
                card_array << Card.new(card.face_value)
            end

        end
        
        card_array.shuffle!

        (0...@size).each do |row|
            (0...@size).each do |col|
                @grid[row][col] = card_array.pop
            end
        end
    end

    def render
        @grid.each do |row|
            row.each do |ele|
                if ele.face_down
                    print ":X"
                else
                    print ele.face_value.to_s
                end
                print " "
            end
            puts
        end
        puts
       
    end

    def reveal(guessed_pos)
        if @grid[guessed_pos].face_down == true
            @grid[guessed_pos].revealed
            return @grid[guessed_pos].face_value
        end
    end

    def won?
        @grid.all? do |row|
            row.all? { |card| card.face_down == false }
        end
    end
end   