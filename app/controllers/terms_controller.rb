class TermsController < ApplicationController
  
  def index 
    @terms = Term.all
    @categories = Category.all
  end

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
      redirect_to category_path(@term.category_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    redirect_to category_path(@term.category_id)
  end

  private
    def term_param
      params.require(:term).permit(:name, :description, :category_id)
    end
  
end
