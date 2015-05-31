class UsersController < ApplicationController
  before_action :authenticate_user!, :only => :show

  def calc
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
      if @user.save
        UserMailer.new_order(@user).deliver_now
        flash[:notice] = 'Your order has succsessfully sent'
        redirect_to calc_users_path
      else
        redirect_to calc_users_path
        flash[:notice] = 'Please fill all fields'
      end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(update_params)
      UserMailer.new_order(@user).deliver_now
      flash[:notice] = 'Your order has succsessfully sent'
      redirect_to calc_users_path
    else
      redirect_to calc_users_path
      flash[:notice] = 'Please fill all fields'
    end
  end

  private
    def update_params
      params.require(:user).permit(:current_league, 
        :current_division, :desired_league, 
        :desired_division, :server, :lp_per_win, :price)
    end

  def show
    
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :email, 
        :skype, :password, :current_league, 
        :current_division, :desired_league, 
        :desired_division, :server, :lp_per_win, :price)
    end
end
