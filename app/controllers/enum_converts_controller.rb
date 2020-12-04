class EnumConvertsController < ApplicationController
  def index
    @converts=EnumConvert.all
  end

  def show
    @enum_convert=EnumConvert.find(params[:id])
  end
  def new
    @enum_convert=EnumConvert.new
  end

  def create
    @enum_convert=EnumConvert.new(convert_params)
    if (@enum_convert.save)
      redirect_to enum_converts_path
    else
      render 'new'
    end
  end
  private def convert_params
    params.require(:enum_convert).permit(:enum_from, :enum_to, :ratio)
  end
  def edit
    @enum_convert=EnumConvert.find(params[:id])
  end
  def update
    @enum_convert=EnumConvert.find(params[:id])
    if (@enum_convert.update(convert_params))
      redirect_to enum_converts_path
    else
      render 'edit'
    end
  end
  def destroy
    @enum_convert=EnumConvert.find(params[:id])
    @enum_convert.destroy
    redirect_to enum_converts_path
  end
end
