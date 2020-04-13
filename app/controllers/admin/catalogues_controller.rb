module Admin
  class CataloguesController < BaseController
    before_action :set_catalogue, only: %i[edit update destroy]

    def index
      @catalogues = Catalogue.page(params[:page])
    end

    def new
      @catalogue = Catalogue.new
    end

    def edit; end

    def create
      @catalogue = Catalogue.new(catalogue_params)

      if @catalogue.save
        redirect(notice: 'Catalogue was successfully created.')
      else
        render :new
      end
    end

    def update
      if @catalogue.update(catalogue_params)
        redirect(notice: 'Catalogue was successfully updated.')
      else
        render :edit
      end
    end

    def destroy
      if @catalogue.destroy
        redirect(notice: 'Catalogue was successfully destroyed.')
      else
        redirect(alert: @catalogue.errors.full_messages.join(', '))
      end
    end

    private

    def set_catalogue
      @catalogue = Catalogue.find(params[:id])
    end

    def catalogue_params
      params.require(:catalogue).permit(:name)
    end

    def redirect(options)
      if options[:notice].present?
        redirect_to admin_catalogues_path, notice: options[:notice]
      else
        redirect_to admin_catalogues_path, alert: options[:alert]
      end
    end
  end
end
