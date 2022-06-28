require_relative "board"
require_relative "card"
require_relative "humanplayer"

class Game
    attr_reader = :previous_guess

    def initialize(size)
        @board = Board.new(size)
        @board.populate
        @previous_guess = nil
        @player_1 = Player.new("player 1")
        @player_2 = Player.new("player 2")
        @current_player = @player_1
    end
    
    def switch_turns!
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.won? == false
            @board.render
            pos = @current_player.get_input
            guess_1 = make_guess(pos)
            while guess_1 == false
                pos = @current_player.get_input
                guess_1 = make_guess(pos)
            end
            
            @board.render
            pos_2 = @current_player.get_input
            guess_2 = make_guess(pos_2)
            while guess_2 == false
                pos_2 = @current_player.get_input
                guess_2 = make_guess(pos_2)
            end
            self.switch_turns!
        end
        @board.render
        puts "Game finished. All cards revealed."
        if @player_1.score == @player_2.score
            puts "Tie game."
        else
            puts "#{@current_player.name} won"
        end
    end

    def make_guess(pos)
        # a guess is invalid if the card is face up
        # or guess is the same as previous guess
        # or guess is out of bounds
        if  !(pos.first >= 0 && pos.first < @board.size) || 
            !(pos.last >= 0 && pos.last < @board.size)
            puts "Invalid guess"
            return false
        end
        if !@board[pos].face_down || pos == @previous_guess
            puts "Invalid guess"
            return false
        end

        if @previous_guess == nil
            if @board[pos].face_down
                @board[pos].revealed
                @previous_guess = pos
            end
        else
            if @board[pos] == @board[@previous_guess]
                @board[pos].revealed
                @board[@previous_guess].revealed
                @current_player.score += 1
            else
                @board[pos].revealed
                @board.render
                sleep(3)
                system("clear")
                @board[pos].hide
                @board[@previous_guess].hide
            end
            @previous_guess = nil
        end

        return true
    end
end