class AccountsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    Stripe.api_key = "sk_test_f6xQ9zdAdLxmNWbv1fC3CIxq"
    @accounts = Stripe::Customer.all
  end

  def create
    Stripe.api_key = "sk_test_f6xQ9zdAdLxmNWbv1fC3CIxq"

    # Create a Customer
    customer = Stripe::Customer.create(
      card: params[:stripe_token],
      plan: "monthly",
      email: params[:email],
      metadata: {
        first_name: params[:first_name],
        last_name: params[:last_name]
      }
    )

    account = Account.new
    account.stripe_customer_id = customer.id
    success = account.save

    if success
      flash[:notice] = "Customer registered!"
      redirect_to accounts_path
    else
      flash[:success] = "Could not sign up user!"
      redirect_to accounts_path
    end
  end
end
