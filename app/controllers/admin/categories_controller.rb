module Admin
  class CategoriesController < BaseController
    load_and_authorize_resource
    before_action :set_catalogue, only: %i[edit update destroy]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def edit; end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    def update
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path, notice: "Category was successfully destroyed."
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
