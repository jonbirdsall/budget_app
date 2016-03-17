class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @budgets = current_user.budgets.all || []
    end 
  end
  
  def about
  end
  
  def contact
  end
end
