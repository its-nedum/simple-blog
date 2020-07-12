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

    def edit
        # This loads the edit page
    end

    def update
        # This method update the
    end

    def destroy
        # This delete a post
    end

    private def post_params
        # tell the form to accept only title and body
        params.require(:post).permit(:title, :body)
    end

end
