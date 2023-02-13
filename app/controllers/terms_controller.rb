class TermsController < ApplicationController
  
  def new
    @term = Term.new
  end

  def create
    @term = Term.create(term_param)
    if @term.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def term_param
      params.require(:term).permit(:name, :description, :category_id)
    end
  
end
