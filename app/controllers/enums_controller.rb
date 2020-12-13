class EnumsController < ApplicationController
  # belongs_to :system, class_name: "System"
    def index
      @enums=Enum.all
    end

    def show
      @enum=Enum.find(params[:id])
    end

    def new
      @enum=Enum.new
    end

    def create
      @enum=Enum.new(enums_params)
      if (@enum.save)
        redirect_to enums_path
      else
        render 'new'
      end
    end

    private def enums_params
      params.require(:enum).permit(:name, :short, :kind, :system_id)
    end

    def edit
      @enum=Enum.find(params[:id])
    end

    def update
      @enum=Enum.find(params[:id])
      if (@enum.update(enums_params))
        redirect_to enums_path
      else
        render 'edit'
      end
    end
    def destroy
      @enum=Enum.find(params[:id])
      @enum.destroy
      redirect_to enums_path
    end
  end

