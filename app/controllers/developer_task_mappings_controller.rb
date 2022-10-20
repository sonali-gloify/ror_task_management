class DeveloperTaskMappingsController < ApplicationController
  before_action :set_developer_task_mapping, only: %i[ show edit update destroy ]

  # GET /developer_task_mappings or /developer_task_mappings.json
  def index
    @developer_task_mappings = DeveloperTaskMapping.all
  end

  # GET /developer_task_mappings/1 or /developer_task_mappings/1.json
  def show
  end

  # GET /developer_task_mappings/new
  def new
    @developer_task_mapping = DeveloperTaskMapping.new
  end

  # GET /developer_task_mappings/1/edit
  def edit
  end

  # POST /developer_task_mappings or /developer_task_mappings.json
  def create
    @developer_task_mapping = DeveloperTaskMapping.new(developer_task_mapping_params)

    respond_to do |format|
      if @developer_task_mapping.save
        format.html { redirect_to developer_task_mapping_url(@developer_task_mapping), notice: "Developer task mapping was successfully created." }
        format.json { render :show, status: :created, location: @developer_task_mapping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @developer_task_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developer_task_mappings/1 or /developer_task_mappings/1.json
  def update
    respond_to do |format|
      if @developer_task_mapping.update(developer_task_mapping_params)
        format.html { redirect_to developer_task_mapping_url(@developer_task_mapping), notice: "Developer task mapping was successfully updated." }
        format.json { render :show, status: :ok, location: @developer_task_mapping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @developer_task_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developer_task_mappings/1 or /developer_task_mappings/1.json
  def destroy
    @developer_task_mapping.destroy

    respond_to do |format|
      format.html { redirect_to developer_task_mappings_url, notice: "Developer task mapping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer_task_mapping
      @developer_task_mapping = DeveloperTaskMapping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def developer_task_mapping_params
      params.require(:developer_task_mapping).permit(:developer, :task)
    end
end
