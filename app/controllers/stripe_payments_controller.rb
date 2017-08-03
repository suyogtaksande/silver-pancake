class StripePaymentsController < ApplicationController
	before_action :find_stripe_payment, only: [:edit, :update, :show]

	def new
		@payment = StripePayment.new
	end

	def index
		@payments = StripePayment.all
	end

	def create
		amount = 1000

		charge = Stripe::Charge.create(
		  :amount => amount,
		  :currency => "usd",
		  :description => "Example charge",
		  :source => params[:stripeToken],
		)
		@payment = StripePayment.new(:customer => charge.customer, :card_token => params[:stripeToken], :amount => amount, :currency=> charge.currency, :user_id => current_user.id)
		@payment.save
		redirect_to stripe_payments_path
	end

private
	def find_stripe_payment
    @payment = StripePayment.find(params[:id])
  end
end
