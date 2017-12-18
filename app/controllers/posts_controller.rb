class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    @posts = @category.posts
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
      format.json {render json: @posts}
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @post}
    end
  end

  def new
    @post = Post.new(category_id: params[:category_id])
  end
  # #
  # # GET /posts/new
  # def new
  #   @post = Post.new(category_id: params[:category_id])
  # end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to categories_path
    else
      render :new
    end
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  # def update
  #   if @post.update(post_params)
  #     redirect_to post_path
  #   else
  #     render :new, notice: 'Error in processing post'
  #   end
  # end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def post_data
    post = Post.find(params[:id])
    render json: PostSerializer.serialize(post)
  end

  # Used in ajax call for "more"
  def body
    render plain: @post.body
  end

  private
    #
    def set_category
      @category = Category.find(params[:category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :avatar, :category_id)
  end
end
