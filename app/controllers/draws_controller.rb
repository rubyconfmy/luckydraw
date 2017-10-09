class DrawsController < ApplicationController
  http_basic_authenticate_with name: "root", password: "root"

  def new
    @user = User.yet_to_win.shuffle.sample
    @user.winner! if @user
  end
end
