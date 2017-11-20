# Sistema de Alocação de Salas - SAS
O projeto tem como finalidade desenvolver um software para o gerenciamento de espaços na universidade de Brasília, especificamente a Faculdade Gama - FGA. O trabalho está sendo desenvolvido pelos alunos do curso de Engenharia de Software que frequentam as aulas de Métodos de Desenvolvimento de Software e Gestão de Portifólios e Projetos.

O status do projeto pode ser acompanhando pelos seguintes indicadores:

[![Coverage Status](https://coveralls.io/repos/github/joaopaulonsoares/2016.2-SAS_FGA/badge.svg?branch=master)](https://coveralls.io/github/joaopaulonsoares/2016.2-SAS_FGA?branch=master)


# Trabalho de GCS

## Integrante
- Aluno: João Paulo Nunes Soares
- Matrícula: 150038267

## Links para os serviços de deploy e CI
 - O deploy da aplicação é realizada de forma integrada com a ferramenta Travis.Este deploy é realizado quando a integração contínua é finalizada e nenhum erro ocorre durante a mesma.
   - Link do deploy: https://sasfgav0.herokuapp.com/
   - Link para informações da build: https://travis-ci.org/joaopaulonsoares/2016.2-SAS_FGA
   
## Explicação da Execução

### Isolamento do Ambiente

Para isolar o ambiente de desenvolvimento da aplicação foi utilizado a ferramenta Docker.Nesse ambiente isolado ja é realizada a uma automação inicial do mesmo, sendo sua última atividade a execução do server da aplicação em localhost. Para executar o mesmo, utiliza-se o comando:

              docker-compose up
              
Quando este comando é executado dois containers são criados, um chamado de Web e outro DB. O container DB possui uma imagem do postgree e fica responsável pelas configurações da camada de armazenamento da aplicação.O container Web por sua vez possui as configurações relacionadas a aplicação Django, tendo as dependências necessárias para execução do projeto e outros procedimentos de configuração realizadas na mesma.

O docker também é utilizado para a realização da Integração Contínua em conjunto com a ferramenta Travis.No Travis a execução das tarefas são realizadas dentro do container,garantindo uma correspondência entre o ambiente em que a integração contínua é realizada com o ambiente presente nas máquinas de desenvolvimento.

### Automação do Ambiente

### Build

### Empacotamento

### Deploy

