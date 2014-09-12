class DebtsController < ApplicationController
  before_action :authenticate_user!

  def index
    @debts = Debt.where(paid: false).sorted
  end

  def history
    if params[:pay]
      @debt = Debt.find(params[:id])
      @debt.paid = true
      if @debt.save
        flash[:notice] = "Debt paid successfully"
      end
    end
    @debts = Debt.where(paid: true).sorted_paid
  end

  def new
    @debt = Debt.new

    @lord = params[:lord]
    @peasant = params[:peasant]

  end

  def create
    debt = Debt.new debt_params
    debt.peasant = User.find(params[:peasant])
    debt.lord = User.find(params[:lord])
    
    if debt.save
      flash[:notice] = "Debt created successfully"
      redirect_to(action: 'index')
    else
      flash[:notice] = "Debt creation failed, Chris probably screwed up somewhere"
      redirect_to(controller: :users, action: :index)
    end
  end

  def edit
    @debt = Debt.find(params[:id])
  end

  def update
    @debt = Debt.find(params[:id])

    if @debt.update_attributes debt_params
      flash[:notice] = "Debt updated successfully"
      redirect_to(action: 'index')
    else
      render 'edit'
    end
  end

  def delete
    @debt = Debt.find(params[:id])
  end

  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy
    flash[:notice] = "Debt destroyed successfully"
    redirect_to(action: 'index')
  end

  private

  def debt_params
    params.require(:debt).permit(:amount, :reason, :peasant, :lord, :paid)
  end
end
