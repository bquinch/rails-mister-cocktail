class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show destroy]
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @dose = Dose.new
  end

  # def new
  #   @cocktail = Cocktail.new
  # end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :index
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require('cocktail').permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
