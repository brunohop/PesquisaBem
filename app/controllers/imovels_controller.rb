class ImovelsController < ApplicationController
  before_action :set_imovel, only: [:show, :edit, :update, :destroy]

  # GET /imovels
  # GET /imovels.json
  def index
    @imovels = Imovel.all
  end

  # GET /imovels/1
  # GET /imovels/1.json
  def show
  end

  # GET /imovels/new
  def new
    empresa  = Empresa.find(params[:empresa_id])
    @imovel = Imovel.new
    @imovel.empresa= empresa

    if (params[:socio_id] != nil)
      socio  = Socio.find(params[:socio_id])
      @imovel.socio= socio
    end
  end

  # GET /imovels/1/edit
  def edit
  end

  # POST /imovels
  # POST /imovels.json
  def create
    @imovel = Imovel.new(imovel_params)

    respond_to do |format|
      if @imovel.save
        empresa  = Empresa.find(@imovel.empresa.id)
        @empresa = empresa

        if(@imovel.socio ==nil)
          format.html { redirect_to @empresa, notice: 'Imóvel foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @imovel }
        else
          socio  = Socio.find(@imovel.socio.id)
          @socio = socio
          format.html { redirect_to @socio, notice: 'Imóvel foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @imovel }
        end
      else
        format.html { render :new }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imovels/1
  # PATCH/PUT /imovels/1.json
  def update
    respond_to do |format|
      if @imovel.update(imovel_params)
        format.html { redirect_to controller:"empresas" ,action: "show", id: @imovel.empresa.id ,  notice: 'Imóvel foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @imovel }
      else
        format.html { render :edit }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imovels/1
  # DELETE /imovels/1.json
  def destroy
    @imovel.destroy
    respond_to do |format|
      format.html { redirect_to imovels_url, notice: 'Imóvel deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imovel
      @imovel = Imovel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imovel_params
      params.require(:imovel).permit(:logradouro, :cep, :bairro, :cidade, :uf, :matricula, :cri, :observacoes, :empresa_id, :socio_id)
    end
end
