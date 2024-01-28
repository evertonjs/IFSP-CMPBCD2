# Banco de Dados da Clínica Veterinária

Nesta pasta, você encontrará os arquivos necessários para criar, gerenciar e manipular o banco de dados de uma clínica veterinária.

## Modelo de Dados

### Tabelas

1. **Cliente (cliente_id, nome, endereco, telefone)**
2. **Animal (animal_id, nome, especie, raca, cliente_id)**
3. **Enfermidade (enfermidade_id, nome, descricao)**
4. **Atendimento (atendimento_id, veterinario_id, animal_id, data_atendimento)**
5. **Veterinario (veterinario_id, nome, especialidade)**

### Relacionamentos

- A tabela Cliente está relacionada com a tabela Animal por meio da coluna cliente_id.
- A tabela Animal está relacionada com a tabela Enfermidade por meio de uma tabela de junção (pode ter várias enfermidades).
- A tabela Atendimento está relacionada com a tabela Veterinario e a tabela Animal.

## Utilização dos Arquivos

1. **Criação do Banco de Dados:**
   - Execute o script SQL `criar_clinica_veterinaria.sql` para criar o esquema do banco de dados.

2. **Popular o Banco de Dados:**
   - Utilize o script SQL `popular_clinica_veterinaria.sql` para inserir dados fictícios e iniciar o banco de dados.

3. **Exploração e Prática:**
   - Após a execução dos scripts, você terá um banco de dados pronto para exploração. Sinta-se à vontade para realizar consultas e manipulações para aprofundar seus conhecimentos.

Certifique-se de ajustar as configurações conforme necessário e, caso tenha alguma dúvida ou sugestão, compartilhe no repositório.
