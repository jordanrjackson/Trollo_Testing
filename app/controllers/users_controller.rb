class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.save
      redirect_to user_boards_path
    else
      render :edit
    end
  end

  private
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end