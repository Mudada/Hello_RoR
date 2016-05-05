class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]
  def create
    @todo_item = @todo_list.todo_items.create(todo_items_params)
    redirect_to @todo_list
  end

  def destroy
    @todo_item = @todo_list.todo_items.where(params[:id]).first
    if @todo_item.destroy
      flash[:success] = "Todo List item was deleted"
    else
      flash[:error] = "Todo List item could not be deleted"
    end
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Todo Item Completed"
  end

  private
  def set_todo_list
    @todo_list = TodoList.where(params[:todo_list_id]).first
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.where(params[:id]).first
  end
  def todo_items_params
    params[:todo_item].permit(:content)
  end
end
