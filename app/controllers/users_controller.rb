class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.paginate(:page => params[:page], :per_page => params[:per_page] ||= 30)
  end

  # GET /users/1 or /users/1.json
  def show
  end


  # POST /users or /users.json

  # PATCH/PUT /users/1 or /users/1.json


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    rescue
      redirect_to comments_path
    end


    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
