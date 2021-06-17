class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      Publisher.publish("user", StateReplicaEvent.new(:create, @user.attributes))
      render json: @user
    end
  end

  def user_params
    params.require(:user).permit(:firstName, :lastName, :age, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
