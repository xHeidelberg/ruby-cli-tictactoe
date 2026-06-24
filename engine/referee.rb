require_relative "base"
module GameRuling
  class Referee # rubocop:todo Style/Documentation
    def check_win?(current_board, marker)
      pattern = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
        [0, 4, 8], [2, 4, 6]             # Diagonals
      ]

      pattern.any? do |line|
        current_board.grid[line[0]].include?(marker) &&
          current_board.grid[line[1]].include?(marker) &&
          current_board.grid[line[2]].include?(marker)
      end
    end
  end
end
