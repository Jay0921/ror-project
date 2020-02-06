module Admin
  class ProductsController < BaseController
    load_and_authorize_resource
    before_action :set_product, only: %i[edit update destroy]
    before_action :set_categories, only: [:new, :edit]

    def index
      @q = Product.ransack(params[:q])
      @products = @q.result.includes(:catalogue_products).page(params[:page])
    end

    def new
      @product = Product.new
      @product.catalogue_products.build
    end

    def edit; end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: 'Product was successfully updated.'
      else
        flash[:alert] = @product.errors.full_messages.join(', ')
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def product_params
      params.require(:product).permit(
        :name,
        :model,
        :description,
        :image,
        :featured,
        :status,
        :membership_id,
        category_list: [],
        catalogue_products_attributes: %i[
          id
          _destroy
          code
          point
          catalogue_id
        ]
      )
    end
  end
end
