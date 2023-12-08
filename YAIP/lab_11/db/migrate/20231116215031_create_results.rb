class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.integer :m
      t.integer :n
      t.integer :nok
      t.integer :nod

      t.timestamps
    end
  end
end
