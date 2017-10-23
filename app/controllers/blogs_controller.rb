class BlogsController < ApplicationController
def index
    @blogs = Blog.all
end
def show
    @blog = Blog.find(params[:id])
end

def new
    @blog = Blog.new
end

def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'You have posted to your blog!' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def blog_params
    params.require(:blog).permit(:title, 
                                :author, 
                                :body 
                                )
  end

end
