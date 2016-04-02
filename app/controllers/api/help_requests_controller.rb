class Api::HelpRequestsController < ApplicationController
  before_action :set_help_request, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def index
    @help_requests = HelpRequest.not_mine(current_user)
    render :json => @help_requests.to_json
  end

  def show
    render :text => @help_request.to_json
  end

  def create
    @help_request = HelpRequest.new(help_request_params)
    @help_request.creator = current_user
    @help_request.status = 0

    if @help_request.save
      render :text => @help_request.to_json
    else
      render :json => { error: 'Не создано' }
    end
  end

  def destroy
    @help_request.destroy
    respond_to do |format|
      format.html { redirect_to help_requests_url, notice: 'Help request was successfully destroyed.' }
    end
  end

  private
    def current_user
      @current_user = User.where(id: params[:user_id])
      unless @current_user.present?
        render :json => { error: 403 }
      end
      @current_user
    end

    def set_help_request
      @help_request = HelpRequest.find(params[:id])
    end

    def help_request_params
      params.require(:help_request).permit(:title, :category, :creator_id, :deadline, :status, :assistant_id)
    end
end
