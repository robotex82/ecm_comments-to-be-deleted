class Ecm::Comments::CommentsController < ApplicationController
  def create
    # render :text => params.inspect and return
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:ecm_comments_comment])
    @comment.client_ip = request.remote_ip
    if @comment.save
      flash[:notice] = "Successfully saved comment."
      #redirect_to :id => nil
      redirect_to :back
    else
      render :action => 'new'
    end
  end

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
  end

  private

  def find_commentable
    if params[:ecm_comments_comment][:commentable_type] && params[:ecm_comments_comment][:commentable_id]
      params[:ecm_comments_comment][:commentable_type].classify.constantize.find(params[:ecm_comments_comment][:commentable_id])
    else
      nil
    end
  end
end
