module Printer
  def print_board(board_state)
    print_column_names
    print_board_boundary
    print_rows(board_state)
    print_board_boundary
    print_column_names
  end

  def print_rows(board_state)
    board_state.each_with_index do |row, i|
      puts "#{i + 1} "[0..1] + "|" + row.join(' ') + '|' + " #{i + 1}"
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
