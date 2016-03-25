class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :category
      t.decimal :amount
      t.references :budget, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
