class CreatePaitents < ActiveRecord::Migration[6.1]
  def change
    create_table :paitents do |t|
      t.string :name
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
