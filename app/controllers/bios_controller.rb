class BiosController < ApplicationController
  unloadable

  def new
    @bio = Bio.new(:user => User.current)
    @bio.safe_attributes = params[:bio]
  end

  def create
    @bio = Bio.new(:user => User.current)
    @bio.safe_attributes = params[:bio]

    if @bio.save
      redirect_to @user
    else
      render 'new'
    end
  end

end
