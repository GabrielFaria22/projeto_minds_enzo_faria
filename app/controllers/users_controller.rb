class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    if params[:commit] == 'Search'
      if params[:search] == "ID"
        @users = User.where(id: params['input'])
      elsif params[:search] == 'Email'
        @users = User.where("email LIKE ?", "%" + params['input'] + "%")
      end
      if @users.blank?
        flash[:error] = "Nada foi encontrado."
      else
        flash[:notice] = "Busca realizada com sucesso."
      end
    end
  end

  def show
  end

  def new

  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Novo assistente criado' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Novo assistente criado' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :id)
    end
end
