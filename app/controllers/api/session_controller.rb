class Api::SessionController < ApplicationController
  before_action :set_help_request, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def create
    if user = User.where(email: params[:email]).first
      if user.valid_password?(params[:password])
        render json: user
      else
        render json: { error: 403 }
      end
    else
      render json: { error: 403 }
    end
  end

end
