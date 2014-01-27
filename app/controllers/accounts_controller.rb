class AccountsController < ActionController::Base
  protect_from_forgery with: :exception

  def new
    render text: 'new'
  end

  def create
    render text: 'creating!'
  end
end
