class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all.page params['page']
    @empresa = Empresa.new
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
     @imovels= @empresa.imovels
     @veiculos= @empresa.veiculos
     @socios= @empresa.socios
     @anexos= @empresa.anexos
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
    @empresas = Empresa.all.page params['page']
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save

        format.html { redirect_to @empresa, notice: 'Empresa foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa foi deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  # GET /empresas/initBusca
  def initBusca
    @empresa = Empresa.new
    end

  # GET /empresas/buscarEmpresa
  def busca
    Rails.logger = Logger.new(STDOUT)

    empresa = Empresa.new(empresa_params)
    @empresas = Empresa.all.page params['page']
    if (empresa.cnpj != '' && empresa.razaoSocial!= '')
    @empresas =   Empresa.where("cnpj LIKE '%#{empresa.cnpj}%' AND razaosocial LIKE '%#{empresa.razaoSocial}%'")
    else
      if (empresa.cnpj != '')
        logger.debug "consulta #{Empresa.where("cnpj LIKE '%#{empresa.cnpj}%'")}"
        @empresas =   Empresa.where("cnpj LIKE '%#{empresa.cnpj}%'")
      end
      if (empresa.razaoSocial != '')
        @empresas = Empresa.where("razaosocial LIKE '%#{empresa.razaoSocial}%'")
      end
    end
      if (empresa.cnpj == nil && empresa.razaoSocial== nil)
        @empresas = Empresa.all.page params['page']
      end
    render "index"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:cnpj, :cidade, :uf, :razaoSocial)
    end
end
