class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def profile
		@user = User.find(params[:id])
		@debts = Debt.where(peasant: @user).where(paid: false).sorted
		@loans = Debt.where(lord: @user).where(paid: false).sorted

	end

	def edit_name
		@user = current_user
	end

	def update_name
		@user = current_user
		#Update the object
		if @user.update_attributes(user_params)
			#If update succeeds, redirect to the index action
			flash[:notice] = "Name updated successfully"
			redirect_to(:action => 'profile')

		else
			#If save fails, re-display the form so user can fix errors
			render('edit_name')
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name)
	end
end
