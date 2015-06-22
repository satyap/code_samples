# TODO needs cleanup, needs tests
# Just a minsweeper area-clearing sample.
# Click a cell, have it expand out or return BOOM/CLEAR

# MineBoard -> expand all the cells that have no mines in corresponding cell
# from this point

class MineBoard

  # @board = 2d array
  # each cell: {mine: boolean, displayed: 0..8}

  # 0..8 -> that many mines surrounding it

  #top-left corner 0,0. i.e. x,y

  MAX_HEIGHT=10
  BOOM=1
  CLEAR=0

  def expand_cell(x,y)
    # assume valid x,y
    cell = @board[x][y]
    return BOOM if cell[:mine]
    return CLEAR if cell[:displayed] == 0
    cell[:displayed] = count_mines(x,y)
    expand_surrounding_cells(x,y) if cell[:displayed] == 0
  end

  def count_mines(x,y)
    count=0
    left_column = x==0 ? nil : @board[x-1]
    right_column = x==MAX_WIDTH ? nil : @board[x+1]
    count += count_mines_in_column(left_column, y)
    count += count_mines_in_column(right_column, y)
    count += count_mines_in_column(@board[x], y)

    return count
  end

  def expand_surrounding_cells(x,y)
    left_column = x==0 ? nil : @board[x-1]
    right_column = x==MAX_WIDTH ? nil : @board[x+1]
    expand_column(left_column, x-1, y)
    expand_column(right_column, x+1, y)
    expand_column(@board[x], x, y)
  end

  def expand_column(column, x, y)
    if column
      expand_cell(x,y)
      expand_cell(x,y-1) if y!=0
      expand_cell(x, y+1) if y != MAX_HEIGHT
    end
  end

  def count_mines_in_column(column, y)
    count = 0
    if column
      count += (
        column[y][:mine] +
        y==0 ? 0 : column[y-1][:mine] +
        y==MAX_HEIGHT ? 0 : column[y+1][:mine]
      )
    end
    return count
  end
end


# board = MineBoard.new(...)

# board.expand_cell(2,0)

