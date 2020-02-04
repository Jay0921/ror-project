class PugsController < ApplicationController
  load_and_authorize_resource
  before_action :set_pug, only: %i[show edit update destroy]

  # GET /pugs
  # GET /pugs.json
  def index
    @pugs = Pug.page(params[:page])
  end

  # GET /pugs/1
  # GET /pugs/1.json
  def show; end

  # GET /pugs/new
  def new
    @pug = Pug.new
  end

  # GET /pugs/1/edit
  def edit; end

  # POST /pugs
  # POST /pugs.json
  def create
    @pug = Pug.new(pug_params)

    respond_to do |format|
      if @pug.save
        format.html { redirect_to @pug, notice: 'Pug was successfully created.' }
        format.json { render :show, status: :created, location: @pug }
      else
        format.html { render :new }
        format.json { render json: @pug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pugs/1
  # PATCH/PUT /pugs/1.json
  def update
    respond_to do |format|
      if @pug.update(pug_params)
        format.html { redirect_to @pug, notice: 'Pug was successfully updated.' }
        format.json { render :show, status: :ok, location: @pug }
      else
        format.html { render :edit }
        format.json { render json: @pug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pugs/1
  # DELETE /pugs/1.json
  def destroy
    @pug.destroy
    respond_to do |format|
      format.html { redirect_to pugs_url, notice: 'Pug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pug
      @pug = Pug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pug_params
      params.fetch(:pug, {}).permit(:name, :age)
    end
end
