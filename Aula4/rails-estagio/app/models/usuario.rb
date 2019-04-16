class Usuario < ActiveRecord::Base
	set_table_name :usuario
	
	validates_presence_of :nome, :message => "Preencha o campo nome, por favor!"
	validates_length_of :nome, :in => 5..150, :allow_blank => true

	# faz uma callback para remover espaços	

	def before_validation
		#self.nome = self.nome.strip
		self.nome = self.nome.squish
	end

	def validate
		if self.nome.size >= 5
			if not /[a-zA-Z]{3,}\ [a-zA-Z]{3,}/ === self.nome
				self.errors.add(:nome, "Nome deve ter duas palavras")
			end
		end
	end

end
