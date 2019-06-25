class BlogsController < ApplicationController
  
  def index
  end

  def new
    @blog = Blog.new
  end

  def create(blog_paramas)
    redirect_to root_path
  end

  def edit
  end

  def update(blog_paramas)
    redirect_to root_path
  end

  def  destory
  end

  private
  def blog_paramas
    params.require(:blog).permit(:body).merge(:user)
  end

  def set_blog
    @blog = Blog.find(:params[:id])
  end
end
