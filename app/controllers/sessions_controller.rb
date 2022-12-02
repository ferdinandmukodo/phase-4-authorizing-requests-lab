class SessionsController < ApplicationController
  # before_action :authorize

  def create
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id
    render json: user
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

  private

  def authorize
    render json: { error: "Not authorized" }, status: :unauthorized
  end
end
