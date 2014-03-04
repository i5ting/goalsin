class RootController < ApplicationController
  def index
		@category = Category.first
		
		
		@s = Section.roots
		p @s
			
		
		 # @ss = Section.arrange(:order => :created_at)
		 
		 # @ss = @s.first.subtree
		 
		 @ss = Section.arrange_serializable
		 
		 @projects = Project.all
		 
  end
	
  def get_tree	 
		 @ss = Section.arrange_serializable
		 
		 render json: @ss, status: :created
  end
	
	
	# _consts.move: {
	# 	TYPE_INNER: "inner",
	# 	TYPE_PREV: "prev",
	# 	TYPE_NEXT: "next"
	# },
	def update_sections_relation
		target_node  = Section.find(params[:pid])
		current_node = Section.find(params[:cid])		
		
		if params[:level ].to_i == 0
			if params[:move_type ] == 'inner'
				puts 'level=0的时候，如果movetype是inner，则正常赋予target_node为父节点'
				current_node.parent = target_node
			else
				puts 'level=0的时候，如果movetype不是inner，无论哪种都必须置空'
				current_node.parent = nil			
			end
		else
			if params[:move_type ] == 'inner'
				current_node.parent = target_node
				puts 'level != 0的时候，如果movetype是inner，则正常赋予父节点'
			else
				current_node.parent = target_node.parent		
				puts 'level != 0的时候，如果movetype不是inner，无论哪种父节点是'
			end
		end
		
		if current_node.save!
			render json: {:code => 0, :msg => 'success'}, status: :created
		else
			render json: {:code => 1, :msg => 'error'}, status: :created
		end
		
	end
	
	def update_sections_name
		current_node = Section.find(params[:cid])		
		current_node.name = params[:name]		
		
		if current_node.save!
			render json: {:code => 0, :msg => 'success'}, status: :created
		else
			render json: {:code => 1, :msg => 'error'}, status: :created
		end
	end
	
	
end
