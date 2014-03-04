class ProjectController < ApplicationController
	
	# skip_before_filter :verify_authenticity_token, :only => [:update_config_with_pair]
	
  # POST /projects
  # POST /projects.json
  def create
    @test = Project.new(project_params)

    respond_to do |format|
      if @test.save!
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test }
      else
        format.html { render action: 'new' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end
	
  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
		@ss = Section.arrange_serializable
	  @projects = Project.all
  end
	
	def update_config_with_pair
		current_project = Project.find(params[:cid])		
	  current_project.__send__ "#{params[:key]}=" , params[:value] 

	  if current_project.save!
		  render json: {:code => 0, :msg => 'success', :data => current_project}, status: :created
	  else
		  render json: {:code => 1, :msg => 'error', :data => current_project}, status: :created
	  end
	end
	
end
