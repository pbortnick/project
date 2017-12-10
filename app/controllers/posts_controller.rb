class PostsController < ApplicationController
  before_action :set_post, only: [:body, :show, :edit, :update, :destroy]
  before_action :set_category, except: [:body, :show, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    if params[:category_id]
      @posts = Category.find(params[:category_id]).posts
    else
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new(category_id: params[:category_id])
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @category.posts.build(post_params)
    if @post.save
      # Render info I need
      # comments show view
      render "posts/details", :layout => false
    else
      render "categorys/show"
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Used in ajax call for "more"
  def body
    render plain: @post.body
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :avatar, :category_id)
    end
end
