class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :source
      t.decimal :amount
      t.references :budget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
