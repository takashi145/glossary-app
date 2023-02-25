class TermsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, { only: [:edit, :update, :destroy]}
  
  def index 
    @terms = current_user.terms
    @categories = current_user.categories
  end

  def new
    @term = Term.new
    @categories = current_user.categories
  end

  def create
    @term = Term.create(term_param)
    if @term.save
      flash[:notice] = '用語が作成されました'
      if @term.category_id
        redirect_to category_path(@term.category_id)
      else
        redirect_to terms_path()
      end
    else
      @categories = current_user.categories
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @term = Term.find(params[:id])
    @categories = current_user.categories
  end

  def update
    @term = Term.find(params[:id])
    if @term.update(term_param)
      if @term.category_id
        redirect_to category_path(@term.category_id)
      else
        redirect_to terms_path()
      end
    else
      @categories = current_user.categories
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    flash[:alert] = '用語が削除されました'

    if @term.category_id
      redirect_to category_path(@term.category_id)
    else
      redirect_to terms_path()
    end

  end

  private
    def term_param
      params.require(:term).permit(:name, :description, :category_id).merge(user_id: current_user.id)
    end

    def ensure_user
      @term = Term.find(params[:id])
      if @term.user_id != current_user.id
        redirect_to('/terms')
      end
    end
  
end
