# Desafio Cuco Health

Este projeto tem como objetivo desenvolver um aplicativo que se comunica com a API https://randomuser.me/api.

## Informações relevantes

- Aplicativo desenvolvido em Flutter com foco no Android e IOS;
- Gerenciador de estado utilizado Flutter_Bloc: https://pub.dev/packages/flutter_bloc;
- Desenvolvido em cima da arquitetura Clean Structure: https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/;
- Dependência utilizada para requisições externas o http: https://pub.dev/packages/http;
- Dependência de armazenamento local utilizado o shared_preferences: https://pub.dev/packages/shared_preferences;
- Injeção de dependências utilizada foi o get_it: https://pub.dev/packages/get_it;
- Dependência utilizada dentro da arquitetura para manipular os dados e os erros dartz: https://pub.dev/packages/dartz.

## Como rodar o aplicativo

- Baixar o repositório remoto ao executar o comando: git clone https://github.com/gbsoares12/desafio-cuco-health.git;
- Executar o comando flutter pub get dentro do diretório do projeto;
- Iniciar um dispositivo emulado executando o comando: emulator -avd "nome do emulador instalado";
- Executar o comando flutter run dentro do diretório do projeto.