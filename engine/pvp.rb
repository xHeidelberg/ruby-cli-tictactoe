# Player vs Player
require_relative "base"
require_relative "referee"
module Pvp
  class Match
    def start_game(current_board, referee)
      loop do
        current_board.clearing
        current_board.display

        player_turn("Player 1", "X".colorize(:red), current_board)
        if referee.check_win?(current_board, "X")
          winner("Player 1", current_board)
          break
        end

        current_board.clearing
        current_board.display

        player_turn("Player 2", "O".colorize(:blue), current_board)
        if referee.check_win?(current_board, "O")
          winner("Player 2", current_board)
          break
        end
      end
    end

    private

    def player_turn(player_name, marker, board)
      loop do
        print "#{player_name}, Choose available slot (1-9)\n: "
        pick = gets.chomp.to_i - 1

        if !pick.between?(0, 8)
          puts "Invalid Position, Try Again!".colorize(:red)
        elsif board.isAvailable?(pick)
          puts "Slot is already taken!, Try Again.".colorize(:red)
        else
          board.move_marker(pick, marker)
          break
        end
      end
    end

    def winner(winner_name, board)
      board.clearing
      board.display
      puts "Congratulations! #{winner_name} Win!".colorize(:green)
    end
  end
end
