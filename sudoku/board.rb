require_relative 'card.rb'

class Board

    def initialize(size)
        @grid = Array.new(size) {Array.new(size)}
    end

    def populate
        card_array = []
        while card_array < (size * size) / 2
            card = Card.create_card
            if !card.include?(card array)
                card_array << card
            end
        end
        card_array *= 2
        card_array.shuffle!
        
        @grid.each do |row|
            row.each do |col|
                @grid[row][col] = card_array.pop
            end
        end
    end
    
end


