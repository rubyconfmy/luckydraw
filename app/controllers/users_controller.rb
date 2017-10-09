class UsersController < ApplicationController
  before_action :authenticate_user!, on: :new

  def new
  end
end
