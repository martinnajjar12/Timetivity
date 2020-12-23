class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
  end

  def destroy(user_id)
    user = User.find(user_id)
    user.destroy
    render json: { url: 'timetivity.herokuapp.com', confirmation_code: Array.new(10){[*"A".."Z", *"0".."9"].sample}.join }
  end

  private

  def facebook_deletion
    user_id = params.permit[:signed_request.id]
    destroy(user_id)
  end
end
