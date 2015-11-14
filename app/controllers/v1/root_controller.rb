class V1::RootController < ApplicationController
  def index
    render json: errors_json('PONG'), status: :not_found
  end
end
