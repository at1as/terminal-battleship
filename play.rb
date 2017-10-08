require_relative 'board'

class Play
  def initialize
    @board = Board.new
  end

  def run(hide_solution)
    while @board.hits_remaining > 0 do

      puts "\nCoordinates, please:\n"
      position = gets.chomp.upcase
      result = @board.fire(position)

      @board.print_solution(hide_solution)

      puts ?\n + result
    end

    puts "You WIN!"
  end
end

hide_solution = ENV['CHEAT'] == 'true' ? false : true
game = Play.new.run(hide_solution)

