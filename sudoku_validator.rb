class SudokuValidator
  attr_reader :sudoku, :cols, :rows, :blocks
  COVERED_DATA = (1..9).to_a

  def initialize(sudoku)
    @sudoku = sudoku
    mount_rows
    mount_cols
    mount_blocks
  end

  def valid?
    valid_cols? && valid_rows? && valid_blocks?
  end

  def valid_rows?
    rows.all? { |row| row.sort == COVERED_DATA }
  end

  def valid_cols?
    cols.all? { |col| col.sort == COVERED_DATA }
  end

  def valid_blocks?
    blocks.all? { |block| block.sort == COVERED_DATA }
  end

  private

  def mount_rows
    @rows = sudoku.dup
  end

  def mount_cols
    @cols = rows.transpose
  end

  def mount_blocks
    @blocks = rows.map do |row|
      row.each_slice(3).to_a
    end.transpose.flatten.each_slice(9).to_a
  end
end

def validSolution(game)
  SudokuValidator.new(game).valid?
end

p validSolution([
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
]).inspect # true (valid!)

p validSolution([
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 0, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
]).inspect # false (invalid!)
