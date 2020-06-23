class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # before_action :set_assisted, only: :new
  # before_action :set_assisted
  # GET /posts
  # GET /posts.json


  # def index
  #   @posts = Post.all
  # end

  def index
    if params[:commit] == 'Search'
      if params[:search] == "Assistente"
        @posts = Post.where(user_id: params['input'])
      elsif params[:search] == 'Título'
        @posts = Post.where("title LIKE ?", "%" + params['input'] + "%")
      elsif params[:search] == 'Conteúdo'
        @posts = Post.where("body LIKE ?", "%" + params['input'] + "%")
      end
      if @posts.blank?
        flash[:error] = "Nada foi encontrado."
      else
        flash[:notice] = "Busca realizada com sucesso."
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.user = current_user
    @post.assisted_id = params[:assisted_id]
    # @post.assisted = @assisted //erroaq
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_assisted
      @post.assisted = Assisted.where(id: params[:assisted_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :assisted_id, :user_id)
    end
end
