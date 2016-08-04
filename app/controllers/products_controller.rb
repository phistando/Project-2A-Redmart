class ProductsController < ApplicationController
  before_action :logged_in_user, only: :index
  before_action :admin_user,     only: [:destroy, :edit, :update, :new, :create]



  def index
    @products = Product.paginate(page: params[:page])

  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.paginate(page: params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # log_in @product
      flash[:success] = "Product registered!"
      redirect_to products_url
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated"
      redirect_to products_url
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end


  private

    def product_params
      params.require(:product).permit(:name, :picture)
    end


    # Confirms an admin user.
    def admin_user
      if !current_user.admin?
        flash[:danger] = "Access is denied"
        redirect_to(products_url)
    end
  end


end
