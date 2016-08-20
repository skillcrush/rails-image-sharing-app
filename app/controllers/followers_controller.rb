class FollowersController < ApplicationController
  before_action :require_login, only: [:index, :new, :create, :destroy]

  # GET /followers
  # GET /followers.json
  def index
    @followers = Follower.all
    @followed = current_user.followed
  end

  # GET /followers/new
  def new
    @follower = Follower.new
    @users = current_user.not_followed
  end

  # POST /followers
  # POST /followers.json
  def create
    @follower = Follower.new(follower_params)

    respond_to do |format|
      if @follower.save
        @followed = current_user.followed
        format.html { redirect_to followers_path }
        format.json { render :show, status: :created, location: @follower }
      else
        format.html { render :new }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followers/1
  # DELETE /followers/1.json
  def destroy
    @follower.destroy
    respond_to do |format|
      format.html { redirect_to followers_url, notice: 'Follower was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follower_params
      params.require(:follower).permit(:user_id, :follower_id)
    end
end
