class V1::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all

    render json: @suppliers
  end
end
