class CountriesController < ApplicationController
  #belongs_to :System

  def index
    @countries=Country.all
  end

  def show
    @country=Country.find(params[:id])
  end
  def new
    @country=Country.new
  end

  def create
    @country=Country.new(countries_params)
    if (@country.save)
      redirect_to countries_path
    else
      render 'new'
    end
  end

  private def countries_params
    params.require(:country).permit(:country, :system_id)
  end

  def edit
    @country=Country.find(params[:id])
  end

  def update
    @country=Country.find(params[:id])
    if (@country.update(countries_params))
      redirect_to countries_path
    else
      render 'edit'
    end
  end
  def destroy
    @country=Country.find(params[:id])
    @country.destroy
    redirect_to countries_path
  end
end
