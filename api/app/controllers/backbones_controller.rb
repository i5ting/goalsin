class BackbonesController < ApplicationController
  before_action :set_backbone, only: [:show, :edit, :update, :destroy]

  # GET /backbones
  # GET /backbones.json
  def index
    @backbones = Backbone.all
  end

  # GET /backbones/1
  # GET /backbones/1.json
  def show
  end

  # GET /backbones/new
  def new
    @backbone = Backbone.new
  end

  # GET /backbones/1/edit
  def edit
  end

  # POST /backbones
  # POST /backbones.json
  def create
    @backbone = Backbone.new(backbone_params)

    respond_to do |format|
      if @backbone.save
        format.html { redirect_to @backbone, notice: 'Backbone was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backbone }
      else
        format.html { render action: 'new' }
        format.json { render json: @backbone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backbones/1
  # PATCH/PUT /backbones/1.json
  def update
    respond_to do |format|
      if @backbone.update(backbone_params)
        format.html { redirect_to @backbone, notice: 'Backbone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backbone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backbones/1
  # DELETE /backbones/1.json
  def destroy
    @backbone.destroy
    respond_to do |format|
      format.html { redirect_to backbones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backbone
      @backbone = Backbone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backbone_params
      params.require(:backbone).permit(:name, :detail)
    end
end
