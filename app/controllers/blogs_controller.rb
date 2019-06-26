class BlogsController < ApplicationController
 before_action :authenticate_user!, except: :index

  def index
   @blogs = Blog.all.includes(:user)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to root_path
  end

  def edit
    @blogman = Blog.find(params[:id])
  end

  def update
    @blogman = Blog.find(params[:id])
    if @blogman.user_id == current_user.id
     @blogman.update(blog_params)
    end
    redirect_to root_path
  end

  def destroy
    @blogman = Blog.find(params[:id])
    if @blogman.user_id == current_user.id
      @blogman.destroy
    redirect_to root_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:body).merge(user_id: current_user.id)
  end

  
end
