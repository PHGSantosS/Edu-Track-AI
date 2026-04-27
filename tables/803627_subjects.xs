// Armazena as disciplinas acadêmicas gerenciadas pelos usuários.
// Meu primeiro comentário via VS Code.
table subjects {
  auth = true

  schema {
    // Chave primária. Identificador único da disciplina.
    uuid id
  
    // Data e hora de criação do registro.
    timestamp created_at?=now
  
    // Chave estrangeira para user.id, indicando o proprietário da disciplina.
    int user_id {
      table = ""
    }
  
    // Nome da disciplina (ex: 'Cálculo I').
    text name
  
    // Descrição detalhada da disciplina.
    text description?
  
    // Nome do professor.
    text teacher_name?
  
    // Status atual da disciplina.
    enum status?=cursando {
      values = ["cursando", "aprovado", "reprovado", "pendente"]
    }
  
    // Data de início da disciplina.
    date start_date?
  
    // Data de término da disciplina.
    date end_date?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "user_id"}]}
  ]
}