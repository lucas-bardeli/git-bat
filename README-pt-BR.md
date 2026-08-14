# ⚡ Git Bat - Simplified Git Workflow

Um script simples para Windows que facilita um fluxo básico de trabalho com Git.

O GitBat combina `git add .` e `git commit -m "mensagem"` em um único comando, com a possibilidade de realizar o push para a branch atual.

A ideia não é substituir o Git ou as interfaces das IDEs, mas tornar um fluxo comum pelo terminal um pouco mais rápido e simples.

## Funcionalidades

- Adiciona e cria o commit das alterações com um único comando
- Push opcional para o `origin`
- Detecta automaticamente a branch atual
- Suporta opções curtas e longas
- Validação básica dos argumentos
- Mantém as mensagens e erros originais do Git
- Mensagens personalizadas para situações comuns
- Instalador simples para Windows
- Adiciona o GitBat ao `PATH` do usuário
- Pode ser instalado com dois cliques no `install.bat`

## Requisitos

- Windows
- Git instalado e disponível no terminal
- Windows PowerShell

O GitBat em si é implementado como um script `.bat`.

O PowerShell é utilizado apenas pelo instalador para gerenciar o `PATH` do usuário.

## Instalação

Clone ou baixe o repositório:

```bash
git clone https://github.com/lucas-bardeli/git-bat.git
```

Entre na pasta do projeto:

```powershell
cd git-bat
```

### Opção 1 — Dois cliques

Abra a pasta do projeto e execute:

```text
install.bat
```

com dois cliques.

O instalador irá:

1. Verificar se o `gitbat.bat` existe.
2. Verificar o `PATH` do usuário atual.
3. Adicionar o diretório do GitBat caso ele ainda não esteja no `PATH`.
4. Evitar entradas duplicadas.
5. Informar o resultado da instalação.

### Opção 2 — Terminal

Também é possível executar o instalador pelo PowerShell ou pelo Prompt de Comando:

```powershell
.\install.bat
```

Depois da instalação, feche o terminal atual e abra um novo.

Então verifique:

```powershell
gitbat --help
```

Se a mensagem de ajuda aparecer, o GitBat está pronto para ser utilizado.

## Uso

O GitBat exige uma mensagem para o commit.

### Criar um commit

```bash
gitbat -m "mensagem do commit"
```

ou:

```bash
gitbat --message "mensagem do commit"
```

O GitBat irá executar:

```bash
git add .
git commit -m "mensagem do commit"
```

### Criar o commit e fazer push

Para criar o commit e enviá-lo para a branch atual:

```bash
gitbat -m "mensagem do commit" --push
```

ou:

```bash
gitbat --message "mensagem do commit" --push
```

Quando `--push` é utilizado, o GitBat detecta automaticamente a branch atual e executa:

```bash
git push origin <branch-atual>
```

Por exemplo, se a branch atual for `feature/login`, o GitBat irá executar:

```bash
git push origin feature/login
```

Isso também funciona no primeiro push de uma branch.

## Opções

| Opção                  | Descrição                                |
| ---------------------- | ---------------------------------------- |
| `-m "mensagem"`        | Define a mensagem do commit              |
| `--message "mensagem"` | Define a mensagem do commit              |
| `--push`               | Faz push para o `origin` na branch atual |
| `-h`                   | Exibe a mensagem de ajuda                |
| `--help`               | Exibe a mensagem de ajuda                |

## Exemplos

Commit básico:

```bash
gitbat -m "adiciona página de login"
```

Commit e push:

```bash
gitbat -m "corrige bug de navegação" --push
```

Utilizando a opção longa:

```bash
gitbat --message "atualiza documentação" --push
```

Exibir ajuda:

```bash
gitbat --help
```

## Como funciona

Sem o GitBat, um fluxo básico pode ser:

```bash
git add .
git commit -m "mensagem"
git push origin main
```

Com o GitBat:

```bash
gitbat -m "mensagem" --push
```

O GitBat cuida das partes repetitivas, mas continua utilizando o próprio Git para realizar as operações.

O fluxo simplificado é:

```text
GitBat
   |
   +-- Valida os argumentos
   |
   +-- Verifica se está em um repositório Git
   |
   +-- git add .
   |
   +-- git commit -m "mensagem"
   |
   +-- [opcional] detecta a branch atual
   |
   +-- [opcional] git push origin <branch>
```

## Tratamento de erros

O GitBat não esconde as mensagens do Git.

Erros e avisos do Git continuam sendo exibidos normalmente, enquanto o GitBat fornece mensagens adicionais para situações comuns.

Por exemplo, ao executar o GitBat fora de um repositório Git:

```text
[GitBat] Error: this directory is not a Git repository.
```

Ao executar o comando sem fornecer uma mensagem de commit, o GitBat informa o problema antes de tentar realizar o commit.

Caso o próprio Git retorne um erro, sua mensagem original continua sendo exibida para que o usuário possa entender o que aconteceu.

## Observações importantes

### `git add .`

Atualmente o GitBat adiciona todas as alterações do repositório utilizando:

```bash
git add .
```

Por isso, o GitBat é indicado para situações em que o usuário está confortável em colocar todas as alterações atuais no commit.

Se for necessário selecionar arquivos individualmente, pode ser mais adequado utilizar o Git diretamente ou a interface de staging da IDE.

### Commit sem alterações

Se não houver alterações para realizar o commit, o Git exibirá:

```text
nothing to commit, working tree clean
```

O GitBat identifica que o commit não foi criado e informa o erro.

### Push

A opção `--push` utiliza sempre:

```bash
git push origin <branch-atual>
```

A branch atual é detectada automaticamente.

## Estrutura do projeto

```text
git-bat/
│
├── gitbat.bat
├── install.bat
├── README.md
├── README-pt-BR.md
├── .gitignore
└── LICENSE
```

### `gitbat.bat`

Script principal do GitBat. É responsável pelos argumentos, validações, commits e pushes opcionais.

### `install.bat`

Instala o GitBat adicionando o diretório do projeto ao `PATH` do usuário atual.

### `README.md`

Documentação em inglês.

### `README-pt-BR.md`

Documentação em português.

### `.gitignore`

Contém regras relacionadas ao Windows para ajudar a evitar o envio acidental de arquivos locais desnecessários ou potencialmente sensíveis.

## Por que BAT?

O GitBat foi desenvolvido intencionalmente como um script `.bat` para Windows.

A ideia é manter a ferramenta simples de executar e distribuir, sem exigir um aplicativo separado ou um runtime adicional.

O instalador utiliza o Windows PowerShell apenas onde ele é mais adequado: no gerenciamento do `PATH` do usuário.

## Limitações atuais

O GitBat é propositalmente pequeno e possui algumas limitações:

- Funciona apenas no Windows
- Utiliza `git add .`, portanto não permite selecionar arquivos individualmente
- Os argumentos devem seguir o formato documentado
- Não possui interface gráfica
- Não resolve conflitos automaticamente
- Ainda não possui um script próprio de desinstalação

Essas limitações podem mudar em versões futuras.

## Contribuição

Sugestões, relatos de problemas e melhorias são bem-vindos.

Caso encontre algum problema, fique à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a MIT License.

Consulte o arquivo `LICENSE` para mais informações.
