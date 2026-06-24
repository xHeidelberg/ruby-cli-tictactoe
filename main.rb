require_relative "engine/base"
require_relative "engine/referee"
require_relative "engine/pvp" # player vs player
require_relative "engine/cvp" # player vs computer
require "colorize"

# Main where the Player execute what to do next
class Main
  def initialize
    @pvp = Pvp::Match.new
    @check = GameRuling::Referee.new
    @board = LoadingBoard::Board.new
    @current_mode = nil
  end

  def player_vs_player
    @current_mode = :pvp
    @board.clearing
    @board.display
    @pvp.start_game(@board, @check)
    ask_again
  end

  def player_computer
    @current_mode = :cvp
    loop do
      @board.clearing
      @board.display

      player1_turn
      if @check.check_win?(@board, "X")
        @board.clearing
        @board.display
        puts "Congratulations You win!".colorize(:green)
        ask_again
        break
      end

      Cvp::ComputerMove.new.execute_move(@board)
      next unless @check.check_win?(@board, "O")

      @board.clearing
      @board.display
      puts "Computer Wins!, You Lose.".colorize(:red)
      ask_again
      break
    end
  end

  def menu
    @board.clearing
    puts "Welcome to CLI - Tic Tac Toe :)"
    puts "Created by: #{'xHeidelberg'.colorize(:red)}"
    puts "==============================="
    option_menu
  end

  def option_menu
    puts "[1] Player vs Player\n[2] Computer vs Player\n[3] Exit Game"
    print ": "
    response = gets.chomp.to_i
    case response
    when 1
      player_vs_player
    when 2
      player_computer
    when 3
      exit!
    else
      puts "Invalid choice you inputted: #{response}"
    end
  end

  def player1_turn
    loop do
      print "Choose available Slot (1-9): "
      pick = gets.chomp.to_i - 1

      if !pick.between?(0, 8)
        puts "Invalid Choice!, Please pick number between 1 to 9.".colorize(:red)
      elsif @board.isAvailable?(pick)
        puts "Slots Already Taken! Try Again.".colorize(:red)
      else
        @board.move_marker(pick, "X".colorize(:red))
        break
      end
    end
  end

  def ask_again
    puts "=========================\nWant to Play again?\n[y] Yes\n[n] No\n[c] Change Mode"
    print ": "
    n = gets.chomp.downcase
    case n
    when "y"
      @board.reset
      if @current_mode == :pvp
        player_vs_player
      else
        player_computer
      end
    when "n"
      @board.reset
      exit!
    when "c"
      @board.reset
      menu
    else
      puts "Invalid choice! Try Again!".colorize(:red)
      ask_again
    end
  end
end

game = Main.new
game.menu
