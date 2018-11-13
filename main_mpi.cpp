//https://github.com/whoshuu/cpr-example/blob/master/CMakeLists.txt
//CMakeList template
//https://www.submarino.com.br/categoria/instrumentos-musicais/violao

//https://www.submarino.com.br/categoria/telefonia-fixa/fax

#include <iostream>
#include <fstream>
#include <cpr/cpr.h>
#include <string>
#include <boost/regex.hpp>
#include <chrono>
#include "produto.h"
#include "crawler.h"

#include <boost/mpi/environment.hpp>
#include <boost/mpi/communicator.hpp>
#include <boost/serialization/vector.hpp>

	namespace mpi = boost::mpi;
using namespace std;


int main(int argc, char** argv) {

	mpi::environment env(argc, argv);
    mpi::communicator world;
	
	if (world.rank() == 0)
    {

    	//declarações	
		vector <string> urls,produtos;
		double tempo_ocioso = 0;
		double tempo_produto_total = 0;
		
		int n_pagina = 0;
		int n_produto = 0;

		chrono::time_point<chrono::high_resolution_clock> start, end, start_oci, end_oci;
		int n_processos = world.size();
		int processo_atual = 1;

		//inicio da contagem de tempo total do programa
		start = chrono::high_resolution_clock::now();

		//ṕegar url como entrada
		//string url = "https://www.submarino.com.br/categoria/instrumentos-musicais/equipamento-para-dj";
		string url = argv[1];

		//pegar o html da pagina inicial
		auto r = cpr::Get(cpr::Url{url});
		tempo_ocioso += r.elapsed;

		//html da pagina inicial
		string html = r.text;
		
		//passa por todas as páginas de produto
		while(url != "last_page"){

			n_pagina ++;
			

			//pega a lista de produtos da pagina
			
			produtos = getProd(html);		
			world.send(processo_atual,0,produtos);
			

			//proxima pagina
			urls.push_back(url);
			url = nextPage(html,url);
			auto r = cpr::Get(cpr::Url{url});
			html = r.text;
			tempo_ocioso += r.elapsed;

			if (processo_atual == n_processos-1)
			{
				processo_atual = 1;
			}
			else
			{
				processo_atual++;
			}

		}

		vector<string> produtos_empty = {""};

		for (int i = 1; i < world.size(); ++i)
		{
			cout << produtos_empty[0];
			world.send(i,0,produtos_empty);
		}

		processo_atual = 1;
		int sum = 0;

		while(true){

			int pcheck, n_produto_p;
			double tempo_produto_total_p,tempo_ocioso_p;

			world.recv(processo_atual,2,n_produto_p);
			n_produto += n_produto_p;
			
			world.recv(processo_atual,3,tempo_ocioso_p);
			tempo_ocioso += tempo_ocioso_p;
			
			world.recv(processo_atual,4,tempo_produto_total_p);
			tempo_produto_total += tempo_produto_total_p;

			world.recv(processo_atual,1,pcheck);
			
			sum += pcheck;

			processo_atual++;			

			if (sum == world.size() - 1)
			{
				break;
			}

		}

		cout << "tempo médio por produto: " << tempo_produto_total/n_produto << "\n";
		cout << "tempo total ocioso: " << tempo_ocioso << "s\n";

		//marcação do tempo total para o programa
		end = chrono::high_resolution_clock::now();
	    chrono::duration<double> func3 = end - start;
	    cout << "tempo total: " << func3.count() << "s\n";
	}
	
	else
	{
		double tempo_ocioso = 0;
		double tempo_produto_total = 0;
		int n_produto = 0;

		while(true){

			chrono::time_point<chrono::high_resolution_clock> start, end, start_prod, end_prod, start_oci, end_oci;


			vector<string> produtos;
			
			world.recv(0,0,produtos);

			if (produtos[0] == "")
			{	
				break;
			}

			for (int unsigned i = 0; i < produtos.size(); ++i)
			{
				//inicio da contagem de tempo para o produto
				start_prod = chrono::high_resolution_clock::now();			
				//pega a pagina de um produto
				auto r = cpr::Get(cpr::Url{produtos[i]});
				//marcação do tempo ocioso para cada produto
				tempo_ocioso += r.elapsed;


				//análise de um produto
				string html_prod = r.text;

				Produto produto = create_prod(html_prod);
				n_produto++;
				string json = produto.jsonGen();
				//marcação do tempo para cada produto
				end_prod = chrono::high_resolution_clock::now();
				
				
				//retorna um objeto no formato json com informações do produto
				cout << json << "\n\n";

	    		chrono::duration<double> func2 = end_prod - start_prod;
		    	cout << "tempo p/ produto: " << func2.count() << "s\n";
		    	tempo_produto_total += func2.count();

		    	//contagem de produtos
				n_produto++;

				cout << "----------//----------//----------//\n\n";
	
			}
		}

		//passa o numero de produtos processados
		world.send(0,2,n_produto);
		//passa o tempo ocioso total
		//cout << "tempo ocioso do processo: " << tempo_ocioso << "\n";
		world.send(0,3,tempo_ocioso);
		//passa o tempo total dos produtos
		world.send(0,4,tempo_produto_total);

		//sinaliza que terminou
		world.send(0,1,1);
	}
	/*
		cout << "tempo médio por produto: " << tempo_produto_total/n_produto << "\n";
		cout << "tempo total ocioso: " << tempo_ocioso << "s\n";

		//marcação do tempo total para o programa
		end = chrono::high_resolution_clock::now();
	    chrono::duration<double> func3 = end - start;
	    cout << "tempo total: " << func3.count() << "s\n";
    */

    
} 