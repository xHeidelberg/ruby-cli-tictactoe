# Base where it store and modify details
module LoadingBoard
  # Initialize the Board location
  class Board
    attr_reader :grid

    def initialize
      @grid = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
      display
    end

    def reset 
      @grid = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
    end

    def display
      puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}"
      puts "--------------"
      puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}"
      puts "--------------"
      puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}"
    end

    def isAvailable?(position) # rubocop:todo Naming/MethodName
      @grid[position].include?("X") || @grid[position].include?("O")
    end

    def move_marker(position, marker)
      @grid[position] = " #{marker} "
    end

    # clearing the terminal for the player not to be confused
    def clearing
      if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
        system("cls")
      else
        system("clear")
      end
    end
  end
end
