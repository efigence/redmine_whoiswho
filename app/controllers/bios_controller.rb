class BiosController < ApplicationController
  helper :sort
  include SortHelper

  before_filter :check_access

  def index
    sort_init 'users.lastname', 'asc'
    sort_update %w(position room users.lastname users.firstname)

    case params[:format]
    when 'xml', 'json'
      @offset, @limit = api_offset_and_limit
    else
      @limit = per_page_option
    end

    scope = Bio.joins(:user).where("users.status = ?", User::STATUS_ACTIVE)
    scope = scope.like(params[:name]) if params[:name].present?

    @bio_count = scope.count
    @bio_pages = Paginator.new @bio_count, @limit, params['page']
    @offset ||= @bio_pages.offset
    @bios =  scope.order(sort_clause).limit(@limit).offset(@offset).to_a
    @bio = User.current.bio if User.current.bio

  end

  def show
    @bio = Bio.find(params[:id])

    render partial: 'show', :layout => false if request.xhr?
  end

  private
  def check_access
    unless User.current.admin? || User.current.has_access?
      redirect_to home_path
    end
  end

end
