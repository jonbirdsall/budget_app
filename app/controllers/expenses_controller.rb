class ExpensesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :store_location
  
  def new
    @expense = Expense.new
    @categories = Category.all
  end
  
  def index
    @budget = find_budget
    @expenses = Expense.where(budget_id: @budget.id)
  end
  
  def create
    @budget = find_budget
    @expense = @budget.expenses.build(expense_params)
    if @expense.save
      flash[:success] = "Expense created."
      redirect_to @budget
    else
      render 'new_budget_expense'
    end
  end
  
  def show
    
  end
  
  def edit
    @categories = Category.all
  end
  
  def update
    if @expense.update_attributes(expense_params)
      flash[:success] = "Expense saved."
      redirect_to @budget
    else
      render 'edit_expense'
    end
  end
  
  def destroy
    @expense.destroy
    flash[:success] = "Expense deleted."
    redirect_to @budget
  end
  
  private
  
    def expense_params
      params.require(:expense).permit(:name, :category, :amount)
    end
    
    def correct_user
      @expense = Expense.find_by(id: params[:id])
      @budget = find_budget
      redirect_to root_url if @budget.nil? || @expense.nil?
    end
    
    def find_budget
      if @expense
        current_user.budgets.find_by(id: params[:budget_id] || @expense.budget_id)
      else
        current_user.budgets.find_by(id: params[:budget_id])
      end
    end
end