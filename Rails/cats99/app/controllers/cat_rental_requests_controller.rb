class CatRentalRequestsController < ApplicationController

  def new
    @all_cats= Cat.all.select(:name, :id)
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def approve
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request.approve!
      redirect_to cat_url(@request.requested_cat)
    else
      render text: "Could not approve request"
    end
  end

  def deny
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request.deny!
      redirect_to cat_url(@request.requested_cat)
    else
      render text: "Could not deny request"
    end
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.requested_cat)
    else
      @all_cats= Cat.all.select(:name, :id)
      @error_message = @cat_rental_request.errors.messages
      render :new
    end
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
