class VeiculosController < ApplicationController
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]

  # GET /veiculos
  # GET /veiculos.json
  def index
    @veiculos = Veiculo.all
  end

  # GET /veiculos/1
  # GET /veiculos/1.json
  def show
  end

  # GET /veiculos/new
  def new
    empresa  = Empresa.find(params[:empresa_id])
    @veiculo = Veiculo.new
    @veiculo.empresa= empresa

    if (params[:socio_id] != nil)
      socio  = Socio.find(params[:socio_id])
      @veiculo.socio= socio
    end
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos
  # POST /veiculos.json
  def create
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        empresa  = Empresa.find(@veiculo.empresa.id)
        @empresa = empresa
        if(@veiculo.socio ==nil)
          format.html { redirect_to @empresa, notice: 'Veículo foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @veiculo }
        else
          socio  = Socio.find(@veiculo.socio.id)
          @socio = socio
          format.html { redirect_to @socio, notice: 'Veículo foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @veiculo }
        end
      else
        format.html { render :new }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculos/1
  # PATCH/PUT /veiculos/1.json
  def update
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to @veiculo, notice: 'Veículo foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1
  # DELETE /veiculos/1.json
  def destroy
    @veiculo.destroy
    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: 'Veículo foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veiculo_params
      params.require(:veiculo).permit(:marca, :modelo, :ano, :placa, :cidade, :uf, :cri, :observacoes, :empresa_id, :socio_id)
    end
end
