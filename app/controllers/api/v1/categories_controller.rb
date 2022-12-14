class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /categories
  def index
    # @categories = Category.all
    @categories = Menu.find(params[:menu_id]).categories
    render json: @categories
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    @user = current_user
    render json: @category

  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  def new
    # We need @restaurant in our `simple_form_for`
    @menu = Menu.find(params[:menu_id])
    @category = Category.new
    render json: @category
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end


  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :menu_id)
    end
end
