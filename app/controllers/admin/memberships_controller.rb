module Admin
  class MembershipsController < BaseController
    load_and_authorize_resource
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
        redirect_to admin_memberships_path, notice: 'Membership was successfully created.'
      else
        render :new
      end
    end

    def update
      if @membership.update(membership_params)
        redirect_to admin_memberships_path, notice: 'Membership was successfully updated.'
      else
        flash[:alert] = @membership.errors.full_messages.join(', ')
        render :edit
      end
    end

    def destroy
      @membership.destroy
      redirect_to admin_memberships_path, notice: 'Membership was successfully destroyed.'
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
  end
end
