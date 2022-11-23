module ExceptionHandler
  extend ActiveSupport::Concern

   # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class DecodeError < StandardError; end
  
  included do
    # Define custom handlers
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unauthorized_request
    rescue_from ExceptionHandler::InvalidToken, with: :unauthorized_request
    rescue_from ExceptionHandler::ExpiredSignature, with: :unauthorized_request
    rescue_from ExceptionHandler::DecodeError, with: :unauthorized_request

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  end

  private

  def unprocessable_entity(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def unauthorized_request(e)
    render json: { message: e.message }, status: :unauthorized
  end

  def not_found(e)
    render json: { message: e.message }, status: :not_found
  end
end