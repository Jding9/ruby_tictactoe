require 'pry'


module Actions

    def play(board)
        puts "What row do you want to pick?"
        row = gets.to_i - 1
        if row > 2 || row < 0
            puts "Try a row between 1 and 3!"
            play(board)
        end
        puts "What column do you want to pick?"
        column = gets.to_i - 1
        if column > 2 || column < 0
            puts "Try a column between 1 and 3!"
            play(board)
        end
        if board[row][column] != " "
            puts "That spot is full! Try another spot"
            print_board(board)
            play(board)
        elsif turn == 1
            board[row][column] = "X"
            self.turn = 2
            print_board(board)
            check_for_winner(board)
        else 
            board[row][column] = "O"
            self.turn = 1
            print_board(board)
            check_for_winner(board)
        end
    end

    def check_for_winner(current_board)

        # horizontal wins
        if current_board[0][0] == current_board[0][1] && current_board[0][1] == current_board[0][2] && current_board[0][2] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"
        elsif current_board[1][0] == current_board[1][1] && current_board[1][1] == current_board[1][2] && current_board[1][2] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"
        elsif current_board[2][0] == current_board[2][1] && current_board[2][1] == current_board[2][2] && current_board[2][2] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"

        # vertical wins
        elsif current_board[0][0] == current_board[1][0] && current_board[1][0] == current_board[2][0] && current_board[2][0] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"
        elsif current_board[0][1] == current_board[1][1] && current_board[1][1] == current_board[2][1] && current_board[2][1] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"
        elsif current_board[0][2] == current_board[1][2] && current_board[1][2] == current_board[2][2] && current_board[2][2] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"

        # diagonol wins

        elsif current_board[0][0] == current_board[1][1] && current_board[1][1] == current_board[2][2] && current_board[2][2] != ' '
            puts turn == 1 ? "Player 1 is the winner": "Player 2 is the winner"
        elsif current_board[0][2] == current_board[1][1] && current_board[1][1] == current_board[2][0] && current_board[2][0] != ' '
            puts turn == 1 ? "Player 1 is the winner!": "Player 2 is the winner!"
            binding.pry
        else 
            puts "No one has won yet, keep playing!"
            play(current_board)
        end
    end

    def print_board(board)
        p board[0]
        p board[1]
        p board[2]
    end

end

class Game
    
    attr_accessor :board, :turn

    include Actions

    def initialize 
        @board = [
            [' ',' ',' '],
            [' ',' ',' '],
            [' ',' ',' ']
        ]

        # Turn refers to either player 1 or player 2's turn (player 1's turn is when @turn is equal to 1)
        @turn = 1

        play(@board)
    end

end

game = Game.new()


p Game.board[0]
p Game.board[1]
p Game.board[2]