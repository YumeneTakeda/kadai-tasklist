class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:show, :destroy]
    
    def index
        @task = current_user.task
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.task.new(task_params)
        
        if @task.save
        	flash[:success] = "Task が正常に投稿されました"
        	redirect_to @task
        #redirect_to...	はリンク先を指定して強制的に飛ばすもの
        else
        	flash.now[:danger] = "Task が投稿されませんでした"
        	render :new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        current_user.task
        
        
        if @task.update(task_params)
        	flash[:success] = "Task が正常に更新されました"
        	redirect_to @task
        #redirect_to...	はリンク先を指定して強制的に飛ばすもの
        else
        	flash.now[:danger] = "Task が更新されませんでした"
        	render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = "Task が正常に削除されました"
        redirect_to tasks_url
    end
    
    private
    #これより下のメソッドはアクションでなく、このクラス内でのみ使用することを明示している
    
    def task_params
        #これがStrong Parameterであり、必要なデータ以外をフィルタにかけて捨てるという意味。
        params.require(:task).permit(:content,:status,:user)
        #permit(:content)で必要なカラムだけを選択している。
    end
    
    def correct_user
        @task = current_user.task.find_by(id: params[:id])
        unless @task
            redirect_to root_url
        end
    end
        
end
