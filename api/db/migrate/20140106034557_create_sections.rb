class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :detail
      t.integer :pid
      t.boolean :done
      t.timestamps
    end
  end
end
