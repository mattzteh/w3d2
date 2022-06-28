require_relative "tile"

class Board

    def self.from_file(file)
        rows = File.readlines(file).map(&:chomp)

        tiles = rows.map do |row|
            nums = row.split("").map { |char| Integer(char) }
            nums.map { |num| Tile.new(num) }
        end

        self.new(tiles)
    end


    def initialize(grid)
        @grid = grid
    end

    def [](pos)
        @grid[pos.first][pos.last]
    end

    def []=(pos, value)
        @grid[pos.first][pos.last] = value
    end

    def render
        @grid.each do |row|
            row.each do |col|
                if col == 0
                    print " "
                else
                    print col.value
                end
            end
            puts
        end
    end
end
