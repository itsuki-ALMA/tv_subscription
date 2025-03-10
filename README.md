# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Sistema de TV por assinatura

1.⁠ ⁠Cadastrar clientes
  - Nome (completo)
  - Idade (completo)

  Validações:
    - Nome e idade obrigatório (completo)
    - Permitido apenas pessoas maiores de idade (completo)

2.⁠ ⁠Cadastrar planos
  - Nome (completo)
  - Valor(completo)

  Validações:
    - Nome e valor obrigatórios  (completo)

3.⁠ ⁠Cadastrar serviços adicionais
  - Nome
  - Valor

  Validações:
    - Nome e valor obrigatórios

4.⁠ ⁠Cadastrar pacotes
  - Nome
  - Plano
  - Serviços adicionais
  - Valor

  Validações: 
    - Nome, plano e valor obrigatórios
  * Se o valor não for informado considere a soma do valor de todos os items do pacote

5.⁠ ⁠Realizar assinatura
  Vincular plano, serviços adicionais e pacote ao cliente. 
  O cliente precisa ter pelo menos um plano ou pacote na assinatura, porém não os dois ao mesmo tempo.
  Serviços adicionais são opcionais e o cliente pode ter vários na mesma assinatura, porém não pode repetir um serviço do pacote.

6.⁠ ⁠Faturar cliente
  No ato da assinatura o sistema faz automaticamente o faturamento do cliente, gerando contas, faturas e carnê.
  Será faturado os 12 meses seguintes a assinatura, a começar pelo mês subsequente. 
  O dia de vencimento de cada mês será sempre o dia da assinatura.
  Contas, faturas e carnês terão os mesmos campos:
    - Data de criação
    - Data de vencimento
    - Valor

  A conta é individual por cada item da assinatura, ou seja, terá uma conta para o plano ou pacote, bem como uma conta para cada serviço adicional, se tiver. O valor será o mesmo valor do item da conta, seja o plano, pacote ou serviço adicional.

  A fatura é o agrupamento de contas do mês, ou seja, a fatura terá a conta do plano ou do serviço e as demais contas de cada serviço adicional.

  O carnê é o agrupamento das faturas dos 12 meses seguintes a assinatura.
