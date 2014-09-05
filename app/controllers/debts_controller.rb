class DebtsController < ApplicationController
  def index
    @debts = Debt.all
  end

  def new
    @debt = Debt.new
  end

  def create
    @debt = Debt.new debt_params

    if @debt.save
      flash[:notice] = "Debt created successfully"
      redirect_to(action: 'index')
    else
      render 'new'
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
    params.require(:debt).permit(:amount, :reason, :peasant, :lord)
  end
end
