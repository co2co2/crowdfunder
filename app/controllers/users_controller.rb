class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      auto_login(@user)
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @project_total = @user.user_pledges
    @total_of_pledges = @user.total_of_pledge
    @total_reward = @user.total_rewards
    @rewards_hash = @user.reward_hash
  end



end
