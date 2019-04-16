class UsuarioController < ApplicationController

  def index
  	#render :text => "LISTA DE USUARIOS"
  	@lista = Usuario.all(:order => "id") # ordena por id
  	# Usuario é o model
  end
  
  def cadastro # html
#	render :text => "<html> <body> <h1> CADASTRO </h1> </body> </html>"
	@usuario = Usuario.new
  end
  
  def save
#  	render :text => "save..."
  	@usuario = Usuario.new
  	@usuario.nome = params[:nome]
  	@usuario.observacao = params[:observacao]
  	@usuario.data_nascimento = params[:data_nascimento]
  	@usuario.save!
  	redirect_to :action => 'index'	
  	rescue	# captura o erro
  		@erro = @usuario.errors.full_messages
  		render :action => "cadastro"
  end
  
  
  def editar # html
  	@usuario = Usuario.find(params[:id])
#  	render :text => u.nome
  end
  
  def update
  	@usuario = Usuario.find(params[:id])
  	@usuario.nome = params[:nome]
  	@usuario.observacao = params[:observacao]
  	@usuario.data_nascimento = params[:data_nascimento]
  	@usuario.save!
  	redirect_to :action => 'index'
 # 	render :text => "update..."
  end
  
  def delete
  	#render :text => "delete..."
  	id = params[:id] # captura o id
  	u = Usuario.find(id)
  	u.delete # não precisa do método save
  	redirect_to :action => 'index' # retorna a pagina index
  end
  
  def buscar # abre tela busca de usuarios
	
  end
  
  def query
 	@lista = Usuario.all(:conditions => ["nome like ?", '%' + params[:nome] + '%'], :order => "nome")
  end  
  

end

