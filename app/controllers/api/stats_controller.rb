class Api::StatsController < ApplicationController
  before_action :current_user

  def index

    render json: { helpResponsesSendedByAnyone: current_user.received_help_responses,
                   helpResponsesSendedByMe: current_user.help_responses.count,
                   assistedHelpRequestCompletedByMe: current_user.assisted_help_requests.completed,
                   createdHelpRequestsCompletedByAnyone: current_user.created_help_requests.completed}
  #   if user = User.where(email: params[:email]).first
  #     if user.valid_password?(params[:password])
  #       render json: user
  #     else
  #       render json: { error: 403 }
  #     end
  #   else
  #     render json: { error: 403 }
  #   end
  # end

end
