# Prova-S206

## Karate

Os testes no Karate foram feitos na API Go REST e possui os seguintes casos de teste:
- GET all users
- GET user by Id
- GET user not found
- POST user
- DELETE user

Os testes que envolvem interações com um usuário específico fazem o post dele para garantir que o teste fique consistente. Para postar usuários múltiplas vezes, existe uma função que gera emails aleatórios, impedindo que a API rejeite postar o usuário com email já cadastrado.

### Executar testes Karate

A partir da pasta "/karate", execute o comando abaixo:
```
mvn test -Dtest=GoRestRunner
```

## Cypress

Os testes de Cypress foram feitos sobre um site de banco e possui os seguintes casos de teste:
- Depositar dólares
- Sacar dólares sem fundo
- Depositar Rupees

O login do usuário na plataforma foi feito através de uma função e um relatório dos testes pode ser gerado utilizando o mochawesome.

### Executar Cýpress
O Cypress pode ser executado com o seguinte comando?
 ```
 ./node_modules/.bin/cypress open
 ```

 Para gerar o relatório do mochawesome, é necessário executar os testes pela linha de comando utilizando o comando abaixo:
 ```
 ./node_modules/.bin/cypress run --spec 'cypress/e2e/**/'
 ```