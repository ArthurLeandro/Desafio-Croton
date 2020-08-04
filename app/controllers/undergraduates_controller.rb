class UndergraduatesController < ApplicationController
  before_action :find_undergraduate, only: [:show, :edit, :update, :destroy] # Deixar um objeto para auxiliar a renderizar os alunos na view

  def index
    @undergraduates = Undergraduate.all
  end

  def show
  end

  def new
    @undergraduate = Undergraduate.new()    
  end

  def edit
  end

  
  def create
    @undergraduate = Undergraduate.new(undergraduate_params)
    # ! Eu não consegui desenvolver uma forma de feedback mostrando para o usuário que ele fez o cadastro ou mensagem de erros
      if(!Undergraduate.exists?(:name => @undergraduate.name)) 
        # Bloquear cadastro com mesmo nome evitando o mesmo aluno de fazer o teste duas vezes.
          # O correto seria aumentar o numero de dados para especializar o tipo de aluno, tornando cada um único.   
        @undergraduate.isAble = true   
        respond_to do |format|  
          if @undergraduate.save
            format.html { redirect_to :controller => 'simulated', :action => 'index'} 
            format.json { render :show, status: :created, location: @undergraduate }
          else
            format.html { redirect_to :controller => 'application', :action => 'index' }
            format.json { render json: @undergraduate.errors, status: :unprocessable_entity }
          end        
      end    
    end
  end

  def update
    respond_to do |format|
      if @undergraduate.update(undergraduate_params)
        format.html { redirect_to @undergraduates, notice: 'Aluno cadastrado com sucesso.' }
        format.json { render :show, status: :ok, location: @undergraduate }
      else
        format.html { render :edit }
        format.json { render json: @undergraduate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @undergraduate.destroy
    respond_to do |format|
      format.html { redirect_to undergraduates_url, notice: 'Deletado do banco de dados com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    def find_undergraduate
      @undergraduate = Undergraduate.find(params[:id])
    end

    def undergraduate_params
      params.require(:undergraduate).permit(:name)
    end
end
