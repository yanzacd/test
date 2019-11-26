class ApplicationController < ActionController::API
  include ActionController::Helpers

  def index
    render json: { message: 'Welcome to Rails Bootstrap' }
  end
end
