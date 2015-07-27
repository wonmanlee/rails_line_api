class AddIndexToLineIndex < ActiveRecord::Migration
  def change
    add_index "lines", ["line_index"]
  end
end
