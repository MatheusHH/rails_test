**Descrição do Sistema** <br/>

<p>Sistema para registros de horários de estagiários.<br/>
  Ao realizar o cadastro pelo link https://sleepy-sands-69673.herokuapp.com/interns/users/sign_in, <br />
  O usuário será direcionado para tela de histórico de registros dos seus pontos. Na mesma tela terá opção de <br />
  realizar o registro da data do registro e horário de chegada. Após o registro os seguintes campos(saída de almoço, volta do almoço <br />
  e saída) estarão sendo liberados na medida que o usuário registra o horário anterior. O usuário não será permitido registrar novos pontos <br />
  até que o ponto atual seja completado. O usuário não será permitido cadastrar valores inconsistentes, Ex: Horário de chegada maior que o de saída. </br > 
</p>

**Tecnologias utilizadas** <br/>

* Ruby versão 2.6.3 
* Rails versão 6.1.1
* Postgresql

**Instruções para executar localmente** <br/>
* Bundle install
* rails db:create
* rails db:migrate

**Link para o projeto online** <br/>
https://sleepy-sands-69673.herokuapp.com/interns/users/sign_in
