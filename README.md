📦 Meu Primeiro Projeto SaaS
Como o nome diz, esse é meu primeiro projeto real, que resolve um problema existente e já conseguiu ao menos um cliente. Inclusive, a ideia surgiu após esse cliente relatar as dificuldades que enfrentava no dia a dia, o que me motivou a criar essa aplicação.

🛑 Qual era o problema?
O cliente trabalha com vendas e realiza as entregas presencialmente. Para se organizar, ele utilizava uma combinação de WhatsApp, Excel e papel:

📄 O papel se desgasta facilmente e pode ser perdido.

📊 O Excel funciona melhor, mas exige que ele role listas enormes, alterne cores para sinalizar dívidas e pagamentos, acompanhe encomendas, e volte nas conversas do WhatsApp para confirmar endereços e datas.

Esse processo tomava tempo, era confuso e sujeito a erros.

✅ O que o projeto soluciona?
A proposta foi reunir tudo isso em uma única aplicação web, simples de usar e acessível de qualquer lugar.

📌 Funcionalidades principais:
Clientes: Armazena nome, endereço, telefone e e-mail. Conta com pesquisa por nome para facilitar buscas em listas grandes.

Compras: Registra de quem foi comprado, a data, o preço e os produtos. Útil para gerar relatórios posteriormente.

Relatórios: Permite consultar um período ou data específica para visualizar renda, produtos mais vendidos e datas de entrega de encomendas.

Dívidas: Controla nome, valor e data de vencimento. Ao vencer, a dívida aparece no dashboard e na aba de dívidas.

Encomendas: Registra nome, data de entrega, status, código de barras e quantidade dos produtos. O preço final é calculado automaticamente.

📌 Obs.: O código de barras precisa estar previamente cadastrado na aba de produtos.

Produtos: Cadastro único de produtos, com nome, preço e código de barras, usado nas encomendas.

-------------------------------------------------------------------------------------------------------------

🖥️ Como rodar o projeto?

bundle install
rails s
No navegador, acesse: http://localhost:3000/

🌐 Deploy
O projeto está hospedado na Render, onde o cliente pode utilizar diariamente.
Para manter a aplicação sempre ativa, utilizo também o UptimeRobot.
