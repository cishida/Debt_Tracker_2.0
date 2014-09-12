class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def profile
		if !params[:id]
			@user = User.find(current_user.id)
		else
			@user = User.find(params[:id])
		end

		@debts = Debt.where(peasant: @user).where(paid: false).sorted
		@loans = Debt.where(lord: @user).where(paid: false).sorted
	end

	def edit_name
		@user = current_user
	end

	def update_name
		@user = current_user
		if @user.update_attributes(user_params)
			flash[:notice] = "Name updated successfully"
			redirect_to(:action => 'profile')
		else
			render('edit_name')
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name)
	end
end
