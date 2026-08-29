# ⚡ Git Bat - Simplified Git Workflow

O **Git Bat** é uma ferramenta leve para Windows que combina `git add .` e `git commit -m "mensagem"` em um único comando, com a possibilidade de realizar o push para a branch atual.

O objetivo não é substituir o Git ou as interfaces das IDEs, mas tornar um fluxo comum pelo terminal mais rápido e conveniente.

## Funcionalidades

- Adiciona e cria o commit de todas as alterações com um único comando
- Push opcional para o `origin`
- Detecta automaticamente a branch atual
- Suporta opções curtas e longas
- Validação básica dos argumentos
- Mantém as mensagens e erros originais do Git
- Mensagens `[GitBat]` com cores para informações, erros e sucesso
- Instalador simples que adiciona o **Git Bat** ao `PATH` do usuário

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

> Para atualizar uma instalação existente, faça pull das alterações mais recentes.

## Uso

### Criar um commit

```bash
gitbat -m "mensagem do commit"
```

ou:

```bash
gitbat --message "mensagem do commit"
```

### Criar o commit e fazer push

```bash
gitbat -m "mensagem do commit" --push
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

### Opções

| Opção                                     | Descrição                                |
| ----------------------------------------- | ---------------------------------------- |
| `-m "mensagem"` ou `--message "mensagem"` | Define a mensagem do commit              |
| `--push`                                  | Faz push para o `origin` na branch atual |
| `-h` ou `--help`                          | Exibe a mensagem de ajuda                |

O **Git Bat** utiliza `git add .`, portanto todas as alterações do repositório são adicionadas ao staging antes do commit.

Se não houver alterações, a mensagem original do Git será exibida:

> nothing to commit, working tree clean

O **Git Bat** não esconde as mensagens ou erros do Git.

## Requisitos

- Windows
- Git instalado e disponível no terminal
- Windows PowerShell

O **Git Bat** é implementado como um script `.bat` e não requer um runtime adicional.

O PowerShell é utilizado apenas pelo instalador para gerenciar com segurança o `PATH` do usuário.

O **Git Bat** é intencionalmente focado em um pequeno fluxo de trabalho pelo terminal. Atualmente, ele não oferece:

- Seleção individual de arquivos para staging
- Interface gráfica
- Resolução automática de conflitos
- Script próprio de desinstalação

## Estrutura do Projeto

```text
git-bat/
├── gitbat.bat      # Script principal do Git Bat
├── install.bat     # Adiciona o Git Bat ao PATH do usuário
├── README.md       # Documentação em inglês
├── README-pt-BR.md # Documentação em português
├── .gitignore      # Regras do Git para arquivos ignorados por segurança
└── LICENSE         # Licença MIT
```

## Contribuição e Licença

Sugestões, relatos de problemas e melhorias são bem-vindos. Caso encontre algum problema, fique à vontade para abrir uma issue ou enviar um pull request.

Este projeto está licenciado sob a MIT License. Consulte o arquivo [LICENSE](LICENSE) para mais informações.
