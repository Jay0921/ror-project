class Admin::CataloguesController < ApplicationController
  load_and_authorize_resource
  before_action :set_catalogue, only: %i[edit update destroy]

  def index
    @catalogues = Catalogue.all
  end

  def new
    @catalogue = Catalogue.new
  end

  def edit; end

  def create
    @catalogue = Catalogue.new(catalogue_params)

    if @catalogue.save
      redirect_to admin_catalogues_path, notice: 'Catalogue was successfully created.'
    else
      render :new
    end
  end

  def update
    if @catalogue.update(catalogue_params)
      redirect_to admin_catalogues_path, notice: 'Catalogue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @catalogue.destroy
    redirect_to admin_catalogues_path, notice: 'Catalogue was successfully destroyed.'
  end

  private

  def set_catalogue
    @catalogue = Catalogue.find(params[:id])
  end

  def catalogue_params
    params.require(:catalogue).permit(:name)
  end
end
