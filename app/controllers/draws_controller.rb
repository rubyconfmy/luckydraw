class DrawsController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def new
    @user = User.yet_to_win.shuffle.sample
    @user.winner! if @user
  end

  def past
    @users = User.winners
  end
end
