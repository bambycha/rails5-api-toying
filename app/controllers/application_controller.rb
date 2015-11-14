class ApplicationController < ActionController::API
  private

  def errors_json(messages)
    { errors: [*messages] }
  end
end
