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
    
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
    def correct_user
      income = Income.find_by(id: params[:id])
      budgetId = income.budget_id
      @budget = find_budget
      redirect_to root_url if @budget.nil?
      @income = income
    end
    
    def find_budget
      current_user.budgets.find_by(id: params[:budget_id])
    end
end
