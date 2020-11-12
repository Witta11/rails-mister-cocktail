class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(set_params)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(set_params)
  end

  def delete
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  private

  def set_params
    params.require(:cocktail).permit(:name)
  end
end
