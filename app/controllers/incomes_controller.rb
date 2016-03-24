class IncomesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @income = Income.new
  end
  
  def index
    @budget = find_budget
    @incomes = Income.where(budget_id: @budget.id)
  end
  
  def create
    @budget = find_budget
    @income = @budget.incomes.build(income_params)
    if @income.save
      flash[:success] = "Income created"
      redirect_to @budget
    else
      render 'new_budget_income'
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @income.update_attributes(income_params)
      flash[:success] = "Income saved."
      redirect_to @budget
    else
      render 'edit_income'
    end
  end

  def destroy
    @income.destroy
    flash[:success] = "Income deleted"
    redirect_to @budget
  end
  
  private
  
    def income_params
      params.require(:income).permit(:source, :amount)
    end
    
    def correct_user
      @income = Income.find_by(id: params[:id])
      @budget = find_budget
      redirect_to root_url if @budget.nil? || @income.nil?
      
    end
    
    def find_budget
      if @income
        current_user.budgets.find_by(id: params[:budget_id] || @income.budget_id)
      else
        current_user.budgets.find_by(id: params[:budget_id])
      end
    end
end
