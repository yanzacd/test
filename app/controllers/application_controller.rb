class ApplicationController < ActionController::API
  include ActionController::Helpers

  def index
    render json: { message: I18n.t('index.welcome') }
  end
end
