class BudgetsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = current_user.budgets.all
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = current_user.budgets.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to root_url, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: :root }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :home, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def correct_user
      @budget = current_user.budgets.find_by(id: params[:id])
      redirect_to root_url if @budget.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:title)
    end
end
