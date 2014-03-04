class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
			
			t.boolean :editable
			t.boolean :checkable
			t.boolean :is_show_icon
			t.boolean :is_show_line
			t.boolean :is_show_title
			t.boolean :is_expand_all
			
      t.timestamps
    end
  end
end
