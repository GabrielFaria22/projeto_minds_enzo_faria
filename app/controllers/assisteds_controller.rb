class AssistedsController < ApplicationController
  before_action :set_assisted, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /assisteds
  # GET /assisteds.json
  def index
    if params[:commit] == 'Search'
      if params[:search] == "CPF"
        @assisteds = Assisted.where(cpf: params['input'])
      elsif params[:search] == 'Nome'
        @assisteds = Assisted.where("name LIKE ?", "%" + params['input'] + "%")
      elsif params[:search] == 'Email'
        @assisteds = Assisted.where(email: params['input'])
      elsif params[:search] == 'Status'
        if params['status_seach'] == 'inativo'
          @assisteds = Assisted.where(status: '0')
        else
          @assisteds = Assisted.where(status: '1')
        end
      end
      if @assisteds.blank?
        flash[:error] = "Nada foi encontrado."
      else

        flash[:notice] = "Busca realizada com sucesso."
      end
    end
  end

  # GET /assisteds/1
  # GET /assisteds/1.json
  def show
  end

  # GET /assisteds/new
  def new
    @assisted = Assisted.new
  end

  # GET /assisteds/1/edit
  def edit
  end

  # POST /assisteds
  # POST /assisteds.json
  def create
    @assisted = Assisted.new(assisted_params)

    respond_to do |format|
      if @assisted.save
        format.html { redirect_to @assisted, notice: 'Assisted was successfully created.' }
        format.json { render :show, status: :created, location: @assisted }
      else
        format.html { render :new }
        format.json { render json: @assisted.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assisteds/1
  # PATCH/PUT /assisteds/1.json
  def update
    respond_to do |format|
      if @assisted.update(assisted_params)
        format.html { redirect_to @assisted, notice: 'Assisted was successfully updated.' }
        format.json { render :show, status: :ok, location: @assisted }
      else
        format.html { render :edit }
        format.json { render json: @assisted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assisteds/1
  # DELETE /assisteds/1.json
  def destroy
    @assisted.destroy
    respond_to do |format|
      format.html { redirect_to assisteds_url, notice: 'Assisted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assisted
      @assisted = Assisted.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assisted_params
      params.require(:assisted).permit(:name, :gender, :address, :name_mother, :cpf, :status, :name_father, :phone1, :phone2, :email, :observation)
    end
end
