# WebCrawler Distribuido
Web crawler em c++ distribuido com OpenMPI
Projeto da matéria de supercomputação
INSPER

## Projeto

Esse projeto realiza uma análise real-time de todos os produtos listados de um categoria específica do e-commerce https://www.submarino.com.br/

O objetivo é realizar uma análise de desempenho comparando uma versão sequencial do projeto com uma multithread.

## Bibliotecas

* [cpr](https://whoshuu.github.io/cpr/) - Fazer o download das páginas HTML
* [Boost Regex](https://theboostcpplibraries.com/boost.regex) - Realizar o parsing dos HTML
* [mpi](https://www.open-mpi.org/faq/?category=mpi-apps) - Realizar a divisão em processos

### Instalação

Primeiro é necessário clonar o repositório

```
git clone https://github.com/AToyama/WebCrawler 
```
Esse projeto é compilado utilizando CMake, ao entrar no diretório clonado compile com:

```
$ cmake .
$ make
```
Isso irá gerar dois executáveis "seq_crawler" e "mpi_crawler", que são respectivamente as versões sequencial e paralela do projeto.

## Executando os testes

Para rodar os teste primeiro é necessário de uma URL válida da qual iremos realizar o rastreamento dos produtos. No site da [submarino](https://www.submarino.com.br/) os produtos são divididos em categoria e então em sub-categorias, logo o formato de url que utilizamos segue o seguinte formato:


```
- https://www.submarino.com.br/categoria/[ categoria ]/[ sub-categoria ]
```

Alguns exemplos de links válidos:

- https://www.submarino.com.br/categoria/audio/micro-system
- https://www.submarino.com.br/categoria/eletrodomesticos/geladeira-refrigerador
- https://www.submarino.com.br/categoria/instrumentos-musicais/violao

O exemplo usado para os teste de memória foi o seguinte:

- https://www.submarino.com.br/categoria/automotivo/mini-geladeira-automotiva

Com 114 produtos.


Para executar o programa:

**Sequencial:**

```
$ ./seq_crawler <https://www.submarino.com.br/categoria/[ categoria ]/[ sub-categoria ]>
```

**MPI:**

```
$ mpiexec -n [numero de processos] ./mpi_crawler <https://www.submarino.com.br/categoria/[ categoria ]/[ sub-categoria ]>
```
O número de processos não pode ser menor que 2.

## Dados:

Como saída do programa teremos para cada produto um json no seguinte formato:

```
{
"nome": "",
"descricao": "",
"foto": "",
"preco": 0,
"preco_parcelado": 0,
"preco_num_parcelas": 0,
"categoria": "",
"url": ""
}
```

E as seguintes medidas de tempo

- Tempo para download da página e análise de cada produto
- Tempo médio de todos produtos
- Tempo total ocioso do programa (tempo para o download de todas as páginas)
- Tempo de execução total do programa
