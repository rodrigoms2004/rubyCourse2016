describe "valida mac address" do
	before (:each) do # before (:all) do, roda todos antes do teste
		@regex = /^(([0-9]|[a-f]){2,2}\:){5,5}([0-9]|[a-f]){2,2}$/
	end
	
	it "deve retornar false quando possuir letra superior a f" do
		(@regex === "f0:de:g1:52:08:76").should == false
	end
	it "deve retornar false quando possuir menos que cinco ':'" do
		(@regex === "f0:de:f1:52:76").should == false
	end
	it "deve retornar false quando o caracter ':' não estiver presente" do
		(@regex === "f0;de;f1@52@08;76").should == false
	end
	it "deve retornar false quando maior que 17 caracteres" do
		(@regex === "af0:de:f1:52:08:768").should == false
	end
    it "deve retornar false quando menor que 17 caracteres" do
    	(@regex === "af:de:f1:52:08:7").should == false
   	end
    it "deve iniciar com 2 caracteres hexadecimal" do
    	(@regex === "0z:de:g1:52:08:76").should == false
    end
    it "deve terminar com 2 caracteres hexadecimal" do
       	(@regex === "f0:de:g1:52:08:7z").should == false
    end
    it "deve retornar true para f0:de:f1:52:08:76" do
    	(@regex === "f0:de:f1:52:08:76").should == true
    end
end

