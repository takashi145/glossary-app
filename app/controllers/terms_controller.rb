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

  def edit
    @term = Term.find(params[:id])
  end

  def update
    @term = Term.find(params[:id])

    if @term.update(term_param)
      redirect_to category_path(@term.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def term_param
      params.require(:term).permit(:name, :description, :category_id)
    end
  
end
