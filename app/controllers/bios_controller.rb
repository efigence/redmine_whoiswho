class BiosController < ApplicationController
  unloadable
  helper BiosHelper

  def index
    @bios = Bio.all
  end

  def show
    @bio = Bio.find(params[:id])
  end

  def new
    @bio = Bio.new
    @bio.user_id = User.current.id
    @bio.safe_attributes = params[:bio]
  end

  def create
    @bio = Bio.new
    @bio.user_id = User.current.id
    @bio.safe_attributes = params[:bio]

    if @bio.save
      redirect_to @user
    else
      render 'new'
    end
  end

end
