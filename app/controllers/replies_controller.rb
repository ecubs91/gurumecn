class RepliesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_blog
  before_action :set_reply, only: [:edit, :update, :destroy]

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.blog_id = @blog.id
    respond_to do |format|
      if @reply.save
        format.html { redirect_to blog_path(@blog), notice: 'Reply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reply }
      else
        format.html { render action: 'new' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @replies = Reply.where(blog_id: @blog.id)
  end
  
  private
    def set_reply
      @reply = Reply.find(params[:id])
    end
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end
  
    def reply_params
      params.require(:reply).permit(:user_id, :blog_id, :comment)
    end
end

