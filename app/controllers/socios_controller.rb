class SociosController < ApplicationController
  before_action :set_socio, only: [:show, :edit, :update, :destroy]

  # GET /socios
  # GET /socios.json
  def index
    @socios = Socio.all
  end

  # GET /socios/1
  # GET /socios/1.json
  def show
    @empresa  = Empresa.find(params[:empresa_id])
    @imovels= @socio.imovels
    @veiculos= @socio.veiculos
  end

  # GET /socios/new
  def new
    if (params[:empresa_id] != nil)
      empresa  = Empresa.find(params[:empresa_id])
    end
    @socio = Socio.new
    @socio.empresa= empresa
  end

  # GET /socios/1/edit
  def edit
  end

  # POST /socios
  # POST /socios.json
  def create
    @socio = Socio.new(socio_params)

    respond_to do |format|
      if @socio.save
        format.html { redirect_to controller:"empresas" ,action: "show", id: @socio.empresa.id ,  notice: 'Sócio foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @socio }
      else
        format.html { render :new }
        format.json { render json: @socio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socios/1
  # PATCH/PUT /socios/1.json
  def update
    respond_to do |format|
      if @socio.update(socio_params)
        format.html { redirect_to @socio, notice: 'Sócio foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @socio }
      else
        format.html { render :edit }
        format.json { render json: @socio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socios/1
  # DELETE /socios/1.json
  def destroy
    @socio.destroy
    respond_to do |format|
      format.html { redirect_to socios_url, notice: 'Sócio foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  # GET /socios/initBusca
  def initBusca
    @socio = Socio.new
    end

  # GET /socios/buscarCpf
  def busca
    Rails.logger = Logger.new(STDOUT)

    socio = Socio.new(socio_params)
    @socios = Socio.all
    if (socio.cpf != '')
      @socios = Socio.where("cpf LIKE '%#{socio.cpf}%'")
    end
    render "index"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socio
      @socio = Socio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def socio_params
      params.require(:socio).permit(:nome, :cpf, :dataNascimento, :administrador, :empresa_id)
    end
end
