class StatusesController < ApplicationController
  def index
    @older_statuses = Status.order("created_at DESC").limit(11)
    @first_status = @older_statuses.shift
  end

  def create
    status = Status.new(status: params[:status], message: params[:message])
    if status.save
      render :nothing => true, :status => 200
    else
      render :text => status.errors.to_a, :status => :unprocessable_entity
    end
  end

  def update
    status = Status.find(params[:id])
    if status.update_attributes(message: params[:message])
      render :nothing => true, :status => 200
    else
      render :text => status.errors.to_a, :status => :unprocessable_entity
    end
  end
end
