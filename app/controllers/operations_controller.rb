class OperationsController < ApplicationController
  load_and_authorize_resource

  def new
    @operation = Operation.new
  end

  def create
    @category = Category.find(params[:category_id])
    @operation = @category.operations.new(operation_params)
    if @operation.save
      flash.notice = 'The operation was registered successfully'
      redirect_to user_category_path(user_id: params[:user_id], id: @category.id)
    else
      flash.alert = "The operation wasn\'t registered. Try again"
      render :new
    end
  end

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end
end
