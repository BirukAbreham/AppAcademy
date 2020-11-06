class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render template: "cats/index"
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render template: "cats/show"
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render template: "cats/new"
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
    
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end

end
