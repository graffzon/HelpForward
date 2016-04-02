class HelpResponsesController < ApplicationController
  before_action :set_help_response, only: [:show, :edit, :update, :destroy]

  def index
    @help_responses = HelpResponse.all
  end

  def show
  end

  def new
    @help_response = HelpResponse.new
  end

  def edit
  end

  def create
    @help_response = HelpResponse.new(help_response_params)
    @help_response.responder = current_user

    respond_to do |format|
      if @help_response.save
        format.html { redirect_to @help_response, notice: 'Help response was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @help_response.update(help_response_params)
        format.html { redirect_to @help_response, notice: 'Help response was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @help_response.destroy
    respond_to do |format|
      format.html { redirect_to help_responses_url, notice: 'Help response was successfully destroyed.' }
    end
  end

  private
    def set_help_response
      @help_response = HelpResponse.find(params[:id])
    end

    def help_response_params
      params.require(:help_response).permit(:responder_id, :help_request_id, :comment, :viewed_by_requestor)
    end
end
