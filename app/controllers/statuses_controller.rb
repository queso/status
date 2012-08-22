class StatusesController < ApplicationController
  def index
    @older_statuses = Status.order("created_at ASC").limit(11)
    @first_status = @older_statuses.shift
  end
end
