class PostsController < ApplicationController
    def index
        @posts = Post.all.order("created_at DESC")
    end

    # This loads the page to create a new post
    def new
        #
        @post = Post.new
    end

    # This method create the new post
    def create
        # get the form data from the form on the "new" view
        @post = Post.new(post_params)
        # save the post
        if(@post.save)
            # redirect to the "show" view
            redirect_to @post
        else
            # if form validation fails stay on the "new" view
            render 'new'
        end
    end

    # This loads a single post
    def show
        # get a single post from the DB where the post id match url params[:id]
        @post = Post.find(params[:id])
    end

    # This loads the edit page
    def edit
        # get the post to edit from DB
        @post = Post.find(params[:id])
    end

    # This method update the
    def update
        # get the post from DB using url params - id
        @post = Post.find(params[:id])
        # update the post
        if(@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end

    # This delete a post
    def destroy
        @post = Post.find(params[:id])  
        @post.destroy
        redirect_to posts_path
        
    end

    private def post_params
        # tell the form to accept only title and body
        params.require(:post).permit(:title, :body)
    end

end
