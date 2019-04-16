class TabelaUsuario < ActiveRecord::Migration
	def self.up
		create_table 	:usuario do |t| # t é o objeto que representa a tabela
			t.string		:nome
			t.date			:data_nascimento
			t.boolean		:arquivado, :default => false, :null => false # hash
			t.timestamps	# cria duas colunas, created e updated
		end
	end
	
	def self.down
		drop_table :usuario
	end
end
