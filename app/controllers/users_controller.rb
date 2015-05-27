class UsersController < ApplicationController

	def calc
  	@user = User.new
  end

  def create_user
  	@user = User.new
  end
end
