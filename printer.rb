module Printer
  def print_board(board_state, hidden = false)
    print_column_names
    print_board_boundary
    print_rows(board_state, hidden)
    print_board_boundary
    print_column_names
  end

  def print_rows(board_state, hidden: true)
    board_state.each_with_index do |row, i|
      row = "#{i + 1} "[0..1] + "|" + row.join(' ') + '|' + " #{i + 1}"

      puts (hidden ? row.gsub(/[^[0-9]\s|OX.]/, '.') : row)
    end
  end

  def print_column_names
    print ' ' * 3
    ('A'..'J').each { |col| print col + ' ' }
    puts
  end

  def print_board_boundary
    puts "#{' ' * 3}#{'–' * 19}"
  end
end
