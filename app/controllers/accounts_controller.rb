class AccountsController < ApplicationController
  protect_from_forgery with: :exception

  def new
  end

  def create
    render text: 'creating!'
  end
end
