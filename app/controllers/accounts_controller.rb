class AccountsController < ApplicationController
  protect_from_forgery with: :exception

  def new
  end

  def create
    # Get the credit card details submitted by the form
    token = params[:stripe_token]

    # Create a Customer
    customer = Stripe::Customer.create(
      card: token,
      plan: "monthly",
      email: params[:email],
      metadata: {
        first_name: params[:first_name],
        last_name: params[:last_name]
      }
    )

    render text: 'creating!'
  end
end
