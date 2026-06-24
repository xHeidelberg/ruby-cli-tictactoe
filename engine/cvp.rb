# Computer vs Playe
require_relative "base"
module Cvp
  # :nodocs:
  class ComputerMove
    def execute_move(current_board)
      n = "O"
      roll = rand(0..8)
      roll = rand(0..8) while current_board.isAvailable?(roll) == true

      current_board.move_marker(roll, n.colorize(:blue))
    end
  end
end
