class OperationsController < ApplicationController
  load_and_authorize_resource

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.user_id = params[:user_id]
    if @operation.save
      flash.notice = 'The operation was registered successfully'
      redirect_to user_category_path(user_id: params[:user_id], id: @operation.category_id)
    else
      flash.alert = "The operation wasn\'t registered. Try again"
      render :new, status: :unprocessable_entity
    end
  end

  def operation_params
    params.require(:operation).permit(:name, :amount, :category_id)
  end
end
