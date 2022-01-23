# Seleção de Desenvolvedor de Software - Escribo

Teste Técnico 02

## Instruções para Uso:

Para a segunda tarefa, foi solicitado o desenvolvimento de uma aplicação que simulasse
o jogo indiano “Cobras e Escadas".

Nas instruções enviadas no guia para o teste, foi solicitado que a aplicação rodasse
em dispositivos Android. Levando em conta está necessidade, aproveitei de uma das
vantagens do Flutter e desenvolvi um Web App, hospedei o mesmo em um projeto no FireBase
e dessa forma o resultado pode ser avaliado e testado em qualquer navegador, seja em
dispositivos Android, seja em dispositivos IOS.

Samsung Galaxy S8+

![image](https://user-images.githubusercontent.com/35077005/150660231-263dd4f5-47d5-4129-a016-d621eb581dba.png)

Google Pixel 5

![image](https://user-images.githubusercontent.com/35077005/150660245-9a911830-3c62-481f-9c00-e8cb0e37ddb8.png)

Iphone XR

![image](https://user-images.githubusercontent.com/35077005/150660253-cd5a4cf6-d3d2-4ea6-8b57-3cc4df396bba.png)

O link para o Web App: https://sds-escribo-teste02.web.app/#/

Mas caso desejem instalar a aplicação em um dispositivo ou em um emulador Android, segue o link com o APK:

https://drive.google.com/file/d/1VmWTcCKuUgNYX5m1xPQQZ5xsT3fYos-Z/view?usp=sharing

Como eu citei acima, uma das maiores vantagens do Flutter é a possibilidade de "buildarmos" a mesma aplicação
para diversos dispositivos, sem a necessidades de mudanças ou adições drásticas ao código.

Dentre outras exigências do guia para o teste, estava a criação de uma Classe "CobrasEscadas".
A mesma pode ser encontrada no seguinte caminho:

lib/models/cobras_escadas.dart

Outra solicitação era exibir avatares que representam cada um dos dois jogadores.

![image](https://user-images.githubusercontent.com/35077005/150660550-572ae8a5-5820-42e3-9a7d-c41b9fbf1a28.png)

![image](https://user-images.githubusercontent.com/35077005/150660517-24445af8-3294-4123-9610-6b64e9c07aa7.png)

Os jogadores são representados por cada uma das caixas, sendo que, na vez de determinado jogador, o ícone P1 ou
P2 é exibido e a caixa tem uma elevação. Indicando dessa forma de quem é a respectiva vez.


Outra solicitação era que houvesse um "Botão Jogar":

![image](https://user-images.githubusercontent.com/35077005/150660602-e94f834b-e25b-4a3e-b2af-c5ee53a3cb4e.png)

Nesse caso o botão apresenta a cor de acordo com a vez de cada jogador, clicando no mesmo, ele gera os valores
dos dados e apresenta as informações da última jogada, ex: Resultado da jogada, casas deslocadas, encontros com
escadas ou cobras.

Por último, podemos acompanhar a evolução de cada jogador, indicado pelos ícone P1 e P2, no grid do App:

![image](https://user-images.githubusercontent.com/35077005/150660670-c7cb9f4b-5df1-4386-94b1-300f00787998.png)


O Codigo foi refatorado de forma que a conferencia e avaliação fiquei mais pratica.

Toda a aplicação é composta somente pelos seguintes scripts:

lib/main.dart

lib/screens/home_screen/home_screen.dart

lib/models/cobras_escadas.dart

lib/models/player_model.dart

lib/widgets/dado_widget.dart

lib/widgets/dados_informacoes_widget.dart

lib/widgets/grid_widget.dart

lib/widgets/jogadoresInfo_widget.dart

lib/widgets/texto_jogador_widget.dart
