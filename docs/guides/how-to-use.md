# Como Usar o Landing Pages AI Squad

## Inicio Rapido

### 1. Injetar no Projeto
Copie a pasta `.claude/` e o `CLAUDE.md` para a raiz do seu projeto de landing page:

```bash
cp -r /Users/dieismyconceicao/projects/landing-pages-ai/.claude/ ./seu-projeto/.claude/
cp /Users/dieismyconceicao/projects/landing-pages-ai/CLAUDE.md ./seu-projeto/CLAUDE.md
cp -r /Users/dieismyconceicao/projects/landing-pages-ai/docs/ ./seu-projeto/docs/
```

### 2. Chamar o Maestro
Abra o Claude Code no diretorio do projeto e chame:

```
@maestro Preciso criar uma LP para [descricao do projeto]
```

O Maestro (Orion) vai coordenar todo o squad automaticamente.

### 3. Chamar Agentes Individuais
Se quiser chamar um agente especifico:

```
@designer Crie os design tokens para um SaaS de produtividade
@frontend Implemente a hero section seguindo o wireframe
@seo Faca um audit completo da pagina
```

## Atalhos

| Atalho | O que faz |
|--------|-----------|
| `@maestro` | Chama o orquestrador (usa quando nao sabe por onde comecar) |
| `@writer` | Chama a Sofia para copy e conteudo |
| `@seo` | Chama o Neo para SEO e tracking |
| `@uxui` | Chama o Kai para UX e wireframe |
| `@designer` | Chama a Luna para design visual |
| `@frontend` | Chama o Max para codigo front-end |
| `@backend` | Chama o Atlas para backend e integracoes |

## Fluxos Comuns

### LP Completa do Zero
```
@maestro *full-pipeline Criar LP para [produto] voltada para [publico]
```

### Apenas Copy
```
@writer *briefing [descricao do produto e publico]
@writer *write-copy
```

### Apenas Implementacao (ja tenho design)
```
@frontend *build-full
```

### Audit de LP Existente
```
@maestro *only-review
```

### LP Rapida (sem gates de aprovacao)
```
@maestro *quick-lp [descricao curta]
```
