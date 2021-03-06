class Admin::UserRolesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin

  def update
    @user = User.find(params[:id])
    if @user.admin?
      @user.role = 'user'
    else
      @user.role = 'admin'
    end

    if @user.save
      respond_to do |format|
        format.json { render nothing: true }
      end
    end
  end
end
