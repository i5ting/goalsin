class AddProjectIdToProjects < ActiveRecord::Migration
  def change
	add_reference :sections, :project, index: true
  end
end
