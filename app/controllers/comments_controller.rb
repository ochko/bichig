class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @comment = Comment.create(params[:comment].
                              merge(:user_id => current_user.id))
    respond_to do |format|
      format.js
    end
  end
end
