class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_filter :must_be_manager, only: [:new, :create, :destroy]

  # GET /tasks or /tasks.json
  def index
     
    if current_user.has_role?(:manager)
      @tasks = Task.all
    elsif current_user.has_role?(:lead)   
      @tasks = Task.where(reporter_id: current_user.id)
      #to fetch developer names for tasks

    elsif current_user.has_role?(:developer)
      taskid = DeveloperTaskMapping.select("task").where(user_id: current_user.id)
      @tasks = Task.where(id: taskid) 
    end
    
  end

  def generate_report
      if current_user.has_role?(:manager)
        @tasks = Task.all
      elsif current_user.has_role?(:lead)   
        @tasks = Task.where(reporter_id: current_user.id)
      end  
      render xlsx: "report", template: "tasks/report.xlsx.axlsx"
  end


  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @user = User.with_role(:lead)
  end

  # GET /tasks/1/edit
  def edit
    @user = User.with_role(:lead)
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      #to update status
      if current_user.has_role?(:lead) || current_user.has_role?(:developer)
        selected_status = params[:task][:status]
        @task.update(status: selected_status)
      end 
      #to assign developer
      if current_user.has_role?(:lead)
        selected_developer = params[:developer_task_mapping][:user_id] 
        #byebug
        DeveloperTaskMapping.where(user_id: selected_developer, task: @task.id).first_or_create
      end
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def must_be_manager
    @user = current_user
    unless @user.has_role? :manager
      redirect_to tasks_url, notice: "Don't have permission to perform this action"
    end  
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :assigned_date, :completion_date, :submission_date, :reporter_id, :status)
    end
end
