require_relative 'board'

class Play
  def initialize
    @board = Board.new
  end

  def run(cheat: false)
    while @board.hits_remaining > 0 do

      puts "\nCoordinates, please:\n"
      position = gets.chomp.upcase
      result = @board.fire(position)

      @board.print_solution if cheat

      puts ?\n + result
    end

    puts "You WIN!"
  end
end

game = Play.new.run(cheat: true)
