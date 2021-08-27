class ProcurementLotsController < ApplicationController
  def index
  end

  def new
    @procurement_lot = ProcurementLot.new
  end

  def create
    @procurement_lot = ProcurementLot.new(procurement_lot_params)

    if @procurement_lot.save
      redirect_to @procurement_lot
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def procurement_lot_params
    params.require(:procurement_lot).permit(:title, :description)
  end
end
