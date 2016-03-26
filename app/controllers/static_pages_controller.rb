class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @budgets = current_user.budgets.order(updated_at: :desc) || []
    end 
  end
  
  def about
  end
  
  def contact
  end
end
