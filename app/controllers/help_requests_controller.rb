class HelpRequestsController < ApplicationController
  before_action :set_help_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @help_requests = HelpRequest.all
  end

  def show
  end

  def new
    @help_request = HelpRequest.new
    @users = User.all
  end

  def edit
  end

  def create
    @help_request = HelpRequest.new(help_request_params)
    @help_request.creator = current_user
    @help_request.status = 0

    respond_to do |format|
      if @help_request.save
        format.html { redirect_to @help_request, notice: 'Help request was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @help_request.update(help_request_params)
        format.html { redirect_to @help_request, notice: 'Help request was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @help_request.destroy
    respond_to do |format|
      format.html { redirect_to help_requests_url, notice: 'Help request was successfully destroyed.' }
    end
  end

  private
    def set_help_request
      @help_request = HelpRequest.find(params[:id])
    end

    def help_request_params
      params.require(:help_request).permit(:title, :category, :creator_id, :deadline, :status, :assistant_id)
    end
end
