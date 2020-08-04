class SimulatedController < ApplicationController  
  before_action :find_simulated, only: [:show, :edit, :update, :destroy] # Deixar um objeto de simulado pronto para ser renderizado pela view

  def index
    @simulated = Simulated.all
  end

  ## Procedimento
  #   Esta ação possui umas variaveis representando as alternativas que foram "splitadas".
  #   Eu optei por fazer desta forma pois eu só teria uma única questão. Caso eu 
  #     precise de expandir a plataforma eu iria criar uma função para todos os casos.
  #   Neste método eu tive que aplicar uma heurística, para responder tem que ser o último usuário a ser cadastrado
  #     esta heurística é importante no momento de impedir o usuário de responder o questionário pela segunda vez
  def show
    @alternative1 = @simulated.alternatives.to_s.split(';')[0]
    @alternative2 = @simulated.alternatives.to_s.split(';')[1]
    @alternative3 = @simulated.alternatives.to_s.split(';')[2]
    @alternative4 = @simulated.alternatives.to_s.split(';')[3]
    @undergraduate = Undergraduate.last()
    @undergraduate.isAble = false
    @undergraduate.save
  end

  ## Procedimento
  #   Esta ação possui umas variaveis representando as alternativas que foram "splitadas".
  def edit
    @alternative1 = @simulated.alternatives.to_s.split(';')[0]
    @alternative2 = @simulated.alternatives.to_s.split(';')[1]
    @alternative3 = @simulated.alternatives.to_s.split(';')[2]
    @alternative4 = @simulated.alternatives.to_s.split(';')[3]    
  end

  def new
  end

  def update
    respond_to do |format|
      if(@simulated.update(simulated_param()))
        saving_data_for_simulated()
        format.html {redirect_to action: "show"}
      else
        format.html { render json: @simulated.erors }
      end
    end
  end

  def delete
  end

  def create
  end
  

  private

  def find_simulated
    @simulated = Simulated.find(params[:id])
  end

  def simulated_param
    params.permit(:correct_value,:id)
  end
  
  ## Procedimento
  #   Este método é responsavel por salvar as respostas de um usuário no banco de dados   
  def saving_data_for_simulated()
    @simulated.amount_taken+=1
    @simulated.correct_value=params[:correct_value]
    @simulated.got_right = false
    # Analisar se o usuário acertou a resposta
    if(@simulated.correct_value == @simulated.correct_alternative)
      @simulated.amount_correct_answers+=1
      @simulated.got_right = true
    end 
    @simulated.save
  end
  
end
