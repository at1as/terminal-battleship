require 'ostruct'
require_relative 'coordinates'
require_relative 'ships'
require_relative 'printer'

class Board
  include Coordinates
  include Printer

  def initialize
    @empty = '.'
    @hit   = 'X'
    @miss  = 'O'
    @board = Array.new(10) { Array.new(10) { @empty } }
    @ship  = Ships.new

    place_ships
  end

  def place_ships
    @ship.all_ships.each do |ship|
      loop do
        position = 1 + rand(100)

        if place_ship(ship, position)
          ship[:placed] = true
          break
        end
      end
    end
  end

  def fire(position)
    coords = alphanumeric_coords_to_numeric(position)

    if (val = get_value_at_position(coords.x, coords.y)) == @empty
      place_at_position(coords.x, coords.y, @miss)
      "Miss!"

    elsif [@hit, @miss].include? val
      "Already guessed this"

    else
      place_at_position(coords.x, coords.y, @hit)
      ship = @ship.ship_at_position(coords.x, coords.y)
      @ship.hit(ship)
      "Hit! You hit the #{ship[:name]}. It has #{ship[:health]} health left"
    end
  end

  def place_ship(ship, position)
    coords = get_coords(position)
    bounds = find_valid_bounds(coords, ship[:size]).sample

    return false unless bounds

    bounds.each do |x, y|
      place_at_position(x, y, ship[:symbol])
      ship[:position] << [x, y]
    end
  end

  def find_valid_bounds(coords, size)
    plus_x, plus_y, minus_x, minus_y = [], [], [], []

    (0...size).each do |delta|
      plus_x  << [coords.x + delta, coords.y]
      minus_x << [coords.x - delta, coords.y]
      plus_y  << [coords.x, coords.y + delta]
      minus_y << [coords.x, coords.y - delta]
    end

    vector_paths = [
      plus_x,
      plus_y,
      minus_x,
      minus_y
    ]

    valid_vector_paths = vector_paths.keep_if do |vectors|
      vectors.flatten.all? { |x| x >= 0 && x < 10 } && !vectors.empty?
    end

    unoccupied_vector_paths = vector_paths.keep_if do |vector|
      vector.all? { |v| get_value_at_position(v[0], v[1]) == @empty }
    end
  end

  def get_value_at_position(x, y)
    @board[y][x]
  end

  def place_at_position(x, y, marker)
    @board[y][x] = marker.to_s
  end

  def print_solution(hide_locations)
    print_board(@board, hidden: hide_locations)
  end

  def hits_remaining
    @ship.all_ships.map { |ship| ship[:size] }.reduce { |x, y| x + y } - @board.flatten.count(@hit)
  end
end
