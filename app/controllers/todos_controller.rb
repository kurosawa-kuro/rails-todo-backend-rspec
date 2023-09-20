class TodosController < ApplicationController

    # 全てのTodoを取得
    def index
      @todos = Todo.all
      render json: @todos
    end
  
    # 新しいTodoを作成
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        render json: @todo, status: :created
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:title)
    end
  end
  