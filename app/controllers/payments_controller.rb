class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  def index
    @payments = Payment.all
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:amount)
  end
end
