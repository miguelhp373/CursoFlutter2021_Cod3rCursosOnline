main(){

	//Tipos Básicos de Variaveis
	int a = 123;
	double b = 1.23;
	boolean estarchovendo = true;

	dinamic x = true; //ela pode alterar o tipo da variavel dinamicamente

  final contantea = 3;//
	const contanteb = 3;//
 
	var c = 'você é muito legal';
	print(c is string);


	//Definindo a Lista
	var lista['miguel','matheus','ana'];
	lista.add('manuela');

	//acessando um item de uma lista
	print(lista.ElementsAt(0));
	print(lista[0]);

	//Tamanho da Lista
	print(lista.length);

	Set<int> ObjectLista = {0,1,2,3,4,5,6,7,8,9,10}; //Define só Inteiros para o conjunto
	var ObjectLista = {0,1,2,3,4,5,6,7,8,9,10}; // define o conjunto

	print(ObjectLista.Length); //Retorna o Tamanho
	print(ObjectLista.Set) //Retorna True

	

//array map

	Map <string,double> notasDosAlunos = {
	'Ana'   :9.7   ,
	'Bia'   :9.2   ,
	'Carlos':7.8   

	//chave:valor
	}


for(var chave in notasDosAlunos.keys){
	print('chave = $chave');
}

for(var valor in notasDosAlunos.values){
	print('chave = $valor' );
}

for(var registro in notasDosAlunos.entries){
	print('${registro.key} : ${registro.value}');
}

}