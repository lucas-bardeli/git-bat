# ⚡ Git Bat - Simplificando o fluxo de trabalho com Git

Um script simples para Windows que facilita um fluxo básico de trabalho com Git.

O **Git Bat** combina `git add .` e `git commit -m "mensagem"` em um único comando, com a possibilidade de realizar o push para a branch atual.

A ideia não é substituir o Git ou as interfaces das IDEs, mas tornar um fluxo comum pelo terminal um pouco mais rápido e simples.

## Funcionalidades

- Adiciona e cria o commit das alterações com um único comando
- Push opcional para o `origin`
- Detecta automaticamente a branch atual
- Suporta opções curtas e longas
- Validação básica dos argumentos
- Mantém as mensagens e erros originais do Git
- Instalador simples que adiciona o **Git Bat** ao `PATH` do usuário

## Requisitos

- Windows
- Git instalado e disponível no terminal
- Windows PowerShell

O **Git Bat** em si é implementado como um script `.bat`.

O PowerShell é utilizado apenas pelo instalador para gerenciar o `PATH` do usuário.

## Instalação

Clone ou baixe o repositório:

```bash
git clone https://github.com/lucas-bardeli/git-bat.git
# Entre no diretório do projeto:
cd git-bat
```

Execute o instalador com dois cliques em [install.bat](install.bat) ou pelo terminal:

```powershell
.\install.bat
```

Após a instalação, abra um novo terminal e verifique:

```powershell
gitbat --help
```

## Uso

### Criar um commit

```bash
gitbat -m "mensagem do commit"
```

ou:

```bash
gitbat --message "mensagem do commit"
```

Isso executa:

```bash
git add .
git commit -m "mensagem do commit"
```

### Criar o commit e fazer push

```bash
gitbat -m "mensagem do commit" --push
```

ou:

```bash
gitbat --message "mensagem do commit" --push
```

Com `--push`, o **Git Bat** detecta a branch atual e executa:

```bash
git push origin <branch-atual>
```

Por exemplo, se a branch atual for `feature/login`, o **Git Bat** executará:

```bash
git push origin feature/login
```

Isso também funciona no primeiro push de uma branch.

## Opções

| Opção                                     | Descrição                                |
| ----------------------------------------- | ---------------------------------------- |
| `-m "mensagem"` ou `--message "mensagem"` | Define a mensagem do commit              |
| `--push`                                  | Faz push para o `origin` na branch atual |
| `-h` ou `--help`                          | Exibe a mensagem de ajuda                |

## Exemplos

```bash
gitbat -m "adiciona página de login"
```

```bash
gitbat -m "corrige bug de navegação" --push
```

```bash
gitbat --help
```

## Como Funciona

Sem o **Git Bat**:

```bash
git add .
git commit -m "mensagem"
git push origin main
```

Com o **Git Bat**:

```bash
gitbat -m "mensagem" --push
```

O **Git Bat** cuida das partes repetitivas, enquanto o Git realiza as operações.

## Observações Importantes

### Staging

Atualmente, o **Git Bat** utiliza:

```bash
git add .
```

Todas as alterações do repositório são adicionadas ao staging antes do commit.

### Sem Alterações

Se não houver alterações para realizar o commit, a mensagem original do Git será exibida:

```text
nothing to commit, working tree clean
```

### Push

A opção `--push` utiliza:

```bash
git push origin <branch-atual>
```

A branch atual é detectada automaticamente.

## Estrutura do Projeto

```text
git-bat/
│
├── gitbat.bat      # Script principal do Git Bat
├── install.bat     # Adiciona o Git Bat ao PATH do usuário
├── README.md       # Documentação em inglês
├── README-pt-BR.md # Documentação em português
├── .gitignore      # Regras do Git para arquivos ignorados
└── LICENSE         # Licença MIT
```

## Por que BAT?

O **Git Bat** foi criado como um script batch do Windows para manter a ferramenta simples de executar e distribuir, sem exigir um runtime adicional.

## Limitações

- Funciona apenas no Windows
- Utiliza `git add .`
- Não possui interface gráfica
- Não resolve conflitos automaticamente
- Não possui um script próprio de desinstalação

## Contribuição

Sugestões, relatos de problemas e melhorias são bem-vindos. Caso encontre algum problema, fique à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a MIT License.

Consulte o arquivo [LICENSE](LICENSE) para mais informações.
