class AddInstructionToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :instruction, :text
  end
end
