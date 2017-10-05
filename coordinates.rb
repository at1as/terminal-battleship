require 'ostruct'

module Coordinates
  def get_coords(position)
    coords = OpenStruct.new
    coords.x = (position - 1) % 10
    coords.y = (position - 1) / 10

    coords
  end

  def alphanumeric_coords_to_numeric(letter_number)
    letter, number = letter_number.slice!(0), letter_number

    coords = OpenStruct.new
    coords.x = ('A'..'J').zip(0..9).to_h[letter]
    coords.y = number.to_i - 1

    coords
  end

  def numeric_coords_to_alphanumeric(coords)
    letter = (0..9).zip('A'..'J').to_h[coords.x]
    number = coords.y

    "#{letter}#{number}"
  end
end
