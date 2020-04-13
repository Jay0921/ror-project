module Admin
  class MembershipsController < BaseController
    before_action :set_membership, only: %i[edit update destroy]

    def index
      @memberships = Membership.page(params[:page])
    end

    def new
      @membership = Membership.new
    end

    def edit; end

    def create
      @membership = Membership.new(membership_params)

      if @membership.save
        redirect(notice: 'Membership was successfully created.')
      else
        render :new
      end
    end

    def update
      if @membership.update(membership_params)
        redirect(notice: 'Membership was successfully updated.')
      else
        flash[:alert] = @membership.errors.full_messages.join(', ')
        render :edit
      end
    end

    def destroy
      if @membership.destroy
        redirect(notice: 'Membership was successfully destroyed.')
      else
        redirect(alert: @membership.errors.full_messages.join(', '))
      end
    end

    private

    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(
        :name,
        :message
      )
    end

    def redirect(options)
      if options[:notice].present?
        redirect_to admin_memberships_path, notice: options[:notice]
      else
        redirect_to admin_memberships_path, alert: options[:alert]
      end
    end
  end
end
