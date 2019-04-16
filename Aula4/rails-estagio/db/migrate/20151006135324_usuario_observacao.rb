class UsuarioObservacao < ActiveRecord::Migration
	def self.up
		add_column :usuario, :observacao, :text # cria a coluna observacao na tabela usuario, do tipo texto
	end
	
	def self.down
		remove_column :usuario, :observacao
	end
end
