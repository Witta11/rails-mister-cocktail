class DosesController < ApplicationController

  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @ingredients = Ingredient.all
  #   @dose = Dose.new
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(set_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
