module ApplicationHelper
	def user_payment
		StripePayment.where(:user_id => current_user.id)
	end
end
