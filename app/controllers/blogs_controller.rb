class BlogsController < InheritedResources::Base
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @blogs = Blog.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @blogs = Blog.where(category_id: @category_id).order("created_at DESC")
    end    
  end
  
  
  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created successfully.!"
      redirect_to blog_path(@blog)
    else
      flash[:error] = "Something went wrong."
      render :new
    end    
  end
  
  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user    
    @tutor_profile = @blog.user.tutor_profile
    @all_comments = @blog.comment_threads
    @root_comments = @blog.root_comments
  end
  
  def create_blog_comment
    @blog = Blog.find(params[:id])
    @user_who_commented = current_user
    @comment = Comment.build_from( @blog, @user_who_commented.id, params[:comment_content] )
    @comment.save
    redirect_to :back
  end

  def create_blog_comment_reply
    @user_who_commented_replied = current_user
    @comment.move_to_child_of(the_desired_parent_comment)
  end
  
  private

  
    def set_blog
      @blog = Blog.find(params[:id])
    end
  
    def blog_params
      params.require(:blog).permit(:user_id, :title, :education, :description, :content, :category_id, :image)
    end
  
    def check_user
      if current_user != @blog.user
        redirect_to root_url, alert: "Sorry, this blog belongs to someone else"
      end
    end
end

