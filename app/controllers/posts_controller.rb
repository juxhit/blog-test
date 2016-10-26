class PostsController < ApplicationController

  before_filter :authorize
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.order(:published_at).page(params[:page]).per(params[:per_page])
    respond_to do |format|
      format.html { render :index }
      format.json { paginate json: @posts }
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.published_at.nil?
      @post.published_at = Time.now
    end

    if @post.save
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @post }
      end
    else
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.permit(:title, :body, :author_id, :published_at)
    end

end
