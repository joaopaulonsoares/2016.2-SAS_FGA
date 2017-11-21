# Sistema de Alocação de Salas - SAS
O projeto tem como finalidade desenvolver um software para o gerenciamento de espaços na universidade de Brasília, especificamente a Faculdade Gama - FGA. O trabalho está sendo desenvolvido pelos alunos do curso de Engenharia de Software que frequentam as aulas de Métodos de Desenvolvimento de Software e Gestão de Portifólios e Projetos.


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

### Automação da Configuração do Ambiente

Para realizar a automação do ambiente foi utilizado a ferramenta Ansible. Esta ferramenta foi configurada para ser utilizada em conjunto com o Vagrant, pois ela possui um papel semelhante com a configuração realizada no docker, tendo essa função de certa forma atuando de forma concorrente.

A configuração do playbook foi realizada para a mesma realizar a configuração do banco postgree na aplicação.Para realizar esta ação os comandos a seguir devem ser executados:
 - Primeiro a máquina virtual deve ser provida, para isso é necessário que esteja instalado o VirtualBox e o Vagrant.Para realizar esta ação utilize o comando a seguir no mesmo diretório do arquivo VagrantFile.
 
        vagrant up

 - Vale-se ressaltar que neste momento a configuração do postgree ja foi realizada, e aplicação já esta pronta para uso.
        
 - Após ter a máquina provida com o nome Web é necessário acessá-la para poder utilizar a aplicação.Utilize o comando a seguir:
 
        vagrant ssh web
 
 - Neste momento estará no shell da máquina.Acesse o diretório onde os arquivos são sincronizados:
 
        cd /vagrant/
 
 - Agora no diretório contendo todos os arquivos, só é necessário realizar as migrações do projeto e executar o server da aplicação.
 
### Build
 
Para a realização da build do projeto a ferramenta Gulp foi escolhida.Porém implementação não ocorreu de forma completa, estando incompleta no trabalho.

### Empacotamento

O empacotamento foi realizado utilizando a ferramenta Egg.Para realizar o empacotamento da aplicação utilize o comando a seguir no mesmo diretório do arquivo setup.py:

                python setup.py bdist_egg
                
Após a execução deste comando será gerado um pacote egg em uma pasta DIST que se encontrará no mesmo diretório do arquivo setup.py

### Deploy

O deploy da aplicação é realizado no Heroku.A aplicação em execução pode ser vista no link: https://sasfgav0.herokuapp.com/ .

O deploy da mesma é realizada de forma contínua no Heroku, e esse deploy é realizado de forma integrada com o TravisCI.Após um commit realizado na master ser aprovado pela ferramenta, a mesma é responsável por indicar ao heroku o deploy da nova versão da aplicação, sendo isso realizada de forma automática.

