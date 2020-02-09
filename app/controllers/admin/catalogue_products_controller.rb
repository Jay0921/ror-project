module Admin
  class CatalogueProductsController < BaseController
    before_action :set_catalogue_product

    def show; end

    private

    def set_catalogue_product
      @catalogue_product = CatalogueProduct.find(params[:id])
    end
  end
end
