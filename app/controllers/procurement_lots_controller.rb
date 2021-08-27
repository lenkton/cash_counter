class ProcurementLotsController < ApplicationController
  def index
    @procurement_lots = ProcurementLot.first(100)
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

  def show
    @procurement_lot = ProcurementLot.find(params[:id])
  end

  private

  def procurement_lot_params
    params.require(:procurement_lot).permit(:title, :description)
  end
end
