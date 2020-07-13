class CommentsController < ApplicationController
    # Rails authentication
    http_basic_authenticate_with name: "chinedu", password: "1234567", only: [:destroy]

    # This method create a comment
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])  
        @comment.destroy
        redirect_to post_path(@post)
    end

    private def comment_params
        params.require(:comment).permit(:username, :body)
    end
end
