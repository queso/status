class StatusesController < ApplicationController
  def index
    @older_statuses = Status.order("created_at ASC").limit(11)
    @first_status = @older_statuses.shift
  end

  def create
    Status.create(up: params[:up], message: params[:message])
    render :nothing => true, :status => 200
  end

  def update
    status = Status.find(params[:id])
    status.update_attributes(message: params[:message])
    render :nothing => true, :status => 200
  end
end
