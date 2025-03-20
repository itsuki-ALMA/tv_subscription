# Projeto Ruby on Rails

Este projeto foi desenvolvido utilizando **Ruby on Rails 8** com **PostgreSQL** como banco de dados. Os testes foram realizados utilizando **Postman**.

## 📌 Requisitos

Antes de começar, certifique-se de ter os seguintes requisitos instalados:

- **Ruby** (versão recomendada: 3.2+)
- **Ruby on Rails** (versão recomendada: 8.0+)
- **Bundler**
- **PostgreSQL**
- **Postman** (para testes de API)

## 🚀 Criando um Novo Projeto Ruby on Rails

Caso queira criar um projeto do zero com a mesma estrutura, siga estes passos:

1. Instale a versão correta do Rails:

   ```sh
   gem install rails -v 8.0.0
   ```

2. Crie um novo projeto:

   ```sh
   rails new nome_do_projeto -d postgresql
   ```

3. Entre na pasta do projeto:

   ```sh
   cd nome_do_projeto
   ```

4. Instale as dependências:

   ```sh
   bundle install
   ```

## ⚙️ Configuração do Banco de Dados

1. Crie um arquivo `.env` na raiz do projeto e adicione as credenciais do banco de dados:

   ```sh
   DATABASE_HOST=localhost
   DATABASE_NAME=tv_subscription_development
   DATABASE_USERNAME= SEU USER POSTGREE
   DATABASE_PASSWORD= SUA SENHA POSTGREE
   DATABASE_PORT=5432
   ```

2. Atualize o arquivo `config/database.yml` para utilizar as variáveis do `.env`:

   ```yaml
   default: &default
     adapter: postgresql
     encoding: unicode
     host: <%= ENV['DATABASE_HOST'] %>
     username: <%= ENV['DATABASE_USERNAME'] %>
     password: <%= ENV['DATABASE_PASSWORD'] %>
     pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

   development:
     <<: *default
     database: <%= ENV['DATABASE_NAME'] %>

   test:
     <<: *default
     database: tv_subscription_test

   production:
     <<: *default
     database: tv_subscription_production
     username: tv_subscription
     password: <%= ENV['TV_SUBSCRIPTION_DATABASE_PASSWORD'] %>
   ```

3. Execute os seguintes comandos para criar e migrar o banco de dados:

   ```sh
   rails db:create db:migrate db:seed
   ```

## 🔥 Executando a Aplicação

Para iniciar o servidor em ambiente de desenvolvimento, execute:

```sh
rails server
```

A aplicação estará disponível em `http://localhost:3000`.

## 📡 Testando a API com Postman

1. Abra o **Postman**
2. Crie uma nova requisição
3. Configure a URL como `http://localhost:3000/{sua_rota}`
4. Se necessário, adicione o corpo da requisição no formato JSON
5. Envie a requisição e analise a resposta

## ultilizando o front

ultilizar o front do repositorio git: https://github.com/itsuki-ALMA/tv-por-assinatura

## 🛠️ Testes

Para rodar os testes automatizados, execute:

```sh
rspec
```

## 📝 Licença

Este projeto está sob a licença MIT.

