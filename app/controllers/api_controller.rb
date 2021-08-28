# app/controllers/api_controller.rb
class ApiController < ActionController::API
  include Pundit
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end
