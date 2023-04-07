# Docker Project

Este repositório contém arquivos Docker para hospedar um [website](https://github.com/wagnerkaba/desafio-dev) usando um servidor Apache.

O repositório contém um arquivo `dockerfile` e um arquivo `docker-compose`. 

O `dockerfile` é usado para criar uma imagem Docker contendo o [website](https://github.com/wagnerkaba/desafio-dev) e configurar o servidor Apache. 

Este `dockerfile` está dividido em duas etapas, utilizando construções multiestágio ([Multi-stage builds](https://docs.docker.com/build/building/multi-stage/)) no Docker. Vamos analisar cada etapa:

* A primeira etapa usa a imagem `alpine/git` como base e define o diretório de trabalho como `/app`. Em seguida, clona um repositório git, o qual contém o website pronto, a partir da URL https://github.com/wagnerkaba/desafio-dev.git para o diretório de trabalho no contêiner.

* A segunda etapa usa a imagem `httpd:alpine` como base, que é uma imagem oficial do `Apache HTTP Server` baseada no Alpine Linux. Em seguida, copia o conteúdo do diretório `/app` da etapa anterior, que contém o repositório git clonado, para o diretório `/usr/local/apache2/htdocs/` no contêiner. Isso fará com que o conteúdo do repositório clonado (ou seja, o website), fique disponível para o `Apache HTTP Server`.

Em resumo, este `dockerfile` clona um repositório git na primeira etapa e copia-o para uma imagem do `Apache HTTP Server` na segunda etapa, configurando um servidor web com um [website](https://github.com/wagnerkaba/desafio-dev).

O arquivo `docker-compose` é usado para construir e executar o contêiner Docker a partir da imagem criada pelo `dockerfile`, especificando as configurações de execução do contêiner.

## Pré-requisitos

Antes de usar este repositório, certifique-se de ter Docker instalado no seu sistema.

## Uso

1. Clone este repositório para sua máquina local.

2. Navegue até o diretório clonado que contém o Dockerfile e o arquivo Docker Compose.

3. Construa a imagem Docker executando o seguinte comando:

   ```
   docker-compose up -d
   ```
4. Acesse o website hospedado pelo servidor apache através do endereço: http://localhost:8080 

5. Para parar o contêiner, execute o seguinte comando:
   ```
   docker-compose down
   ```