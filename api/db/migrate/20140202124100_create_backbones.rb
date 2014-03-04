class CreateBackbones < ActiveRecord::Migration
  def change
    create_table :backbones do |t|
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
