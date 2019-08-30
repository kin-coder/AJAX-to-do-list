class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end



  def create
    @task = Task.new(task_params) # ok


    @category = Category.find(category_params)

    @task.category = @category



    respond_to do |format|

        format.html {

          if @task.save
            redirect_to root_path
            flash[:notice] = "Task created"

          else
            redirect_to root_path
            flash[:notice] = "Please try again"

          end
        }

      format.js {@task.save}
    end

  end



  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    @task.update(status: params[:change])  # maka lay noma ary am check_box
    @task.update(task_params)
    puts params[:change]   # mcheck raha mvok

    respond_to do |format|

        format.html {
    redirect_to tasks_path}
    flash[:notice] = "Task edited"
    format.js { }
    end
  end

  def index
    @tasks = Task.all
  end



  def destroy

    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|

        format.html {

    redirect_to root_path
    flash[:notice] = "Task DELETED"}
    format.js {}
    end
  end





  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
