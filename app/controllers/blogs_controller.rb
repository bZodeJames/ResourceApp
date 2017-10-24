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

def edit
    @blog = Blog.find(params[:id]) 
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

  def update
    @blog = Blog.find(params[:id]) 

    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Your Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id]) 

    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog post was successfully removed.' }
      format.json { head :no_content }
    end
  end

private

  def blog_params
    params.require(:blog).permit(:title, 
                                :author, 
                                :body 
                                )
  end

end
