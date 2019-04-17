class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy, :new_post]

  # GET /posts
  # GET /posts.json
  def index
    posts = Post.all

    render :json => posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    post = Post.new
    post.name = params[:name]
    post.description = params[:description]

    if post.save

      render :json => post

    else

      post = nil;
      render :json => post

    end

    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end 
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

    post = Post.find(params[:id])

    post_backup = post

    post.destroy

    render :json => post_backup

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :description)
    end
end
