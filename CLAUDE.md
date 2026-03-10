# Landing Pages AI Squad

## Visao Geral

Este repositorio contem um squad de agentes especializados em criacao de landing pages de alta conversao. Cada agente representa um profissional com 15+ anos de experiencia e trabalham em conjunto seguindo um pipeline estruturado.

## Como Usar

Este repositorio deve ser **injetado** dentro do projeto da landing page. Basta copiar a pasta `.claude/` para a raiz do seu projeto.

## Squad de Agentes

| Agente | Arquivo | Comando | Papel |
|--------|---------|---------|-------|
| Web Designer | `web-designer.md` | `@designer` | Design visual, layout, identidade |
| Front-End Dev | `frontend-dev.md` | `@frontend` | HTML, CSS, JS, responsividade |
| Back-End Dev | `backend-dev.md` | `@backend` | Servidor, banco, integracoes |
| Content Writer | `content-writer.md` | `@writer` | Copy, textos, CTAs |
| UX/UI Designer | `ux-ui-designer.md` | `@uxui` | Experiencia do usuario, usabilidade |
| SEO Specialist | `seo-specialist.md` | `@seo` | Otimizacao para buscadores |

## Pipeline de Criacao

O fluxo de trabalho segue esta ordem:

```
1. BRIEFING     → @writer coleta informacoes e define messaging
2. ESTRATEGIA   → @seo define palavras-chave e estrutura SEO
3. UX/UI        → @uxui cria wireframe e fluxo do usuario
4. DESIGN       → @designer cria o visual completo
5. FRONTEND     → @frontend implementa o design em codigo
6. BACKEND      → @backend implementa formularios, APIs, integrações
7. REVIEW       → Todos revisam suas areas de expertise
```

## Comandos do Squad

- `*briefing [descricao]` — Inicia o pipeline com o @writer coletando informacoes
- `*wireframe` — @uxui cria a estrutura e fluxo da pagina
- `*design` — @designer cria o layout visual
- `*build` — @frontend + @backend implementam o codigo
- `*review` — Todos os agentes revisam o resultado
- `*optimize` — @seo + @uxui otimizam performance e conversao
- `*full-pipeline [descricao]` — Executa todo o pipeline de ponta a ponta

## Regras Globais

1. **Colaboracao obrigatoria**: Nenhum agente trabalha isolado. Sempre considerar o output dos agentes anteriores no pipeline.
2. **Mobile-first**: Todo design e codigo devem priorizar mobile.
3. **Performance**: Lighthouse score minimo de 90 em todas as metricas.
4. **Conversao**: Cada decisao deve ser justificada pela perspectiva de conversao.
5. **Acessibilidade**: WCAG 2.1 nivel AA como minimo.
6. **SEO**: Cada pagina deve ter meta tags completas, schema markup e URLs amigaveis.

## Stack Tecnologico Padrao

- **HTML5** semantico
- **CSS3** com variaveis customizadas (design tokens)
- **JavaScript** vanilla ou framework leve (Alpine.js, HTMX)
- **Tailwind CSS** como framework utilitario (opcional)
- **GSAP** / **Lottie** para animacoes avancadas
- **Formatos modernos**: WebP/AVIF para imagens, WOFF2 para fontes

## Estrutura do Projeto Gerado

```
projeto-lp/
├── .claude/
│   └── agents/          # Agentes do squad (injetados)
├── index.html           # Pagina principal
├── assets/
│   ├── css/
│   │   ├── tokens.css   # Design tokens
│   │   ├── base.css     # Reset e tipografia
│   │   ├── components.css
│   │   └── utilities.css
│   ├── js/
│   │   ├── main.js
│   │   └── animations.js
│   ├── images/
│   └── fonts/
├── api/                 # Endpoints backend (se necessario)
├── docs/
│   ├── briefing.md      # Briefing do projeto
│   ├── seo-strategy.md  # Estrategia SEO
│   └── wireframe.md     # Documentacao UX
└── CLAUDE.md            # Configuracao do squad
```

## Convencoes

- **Arquivos**: kebab-case (ex: `hero-section.css`)
- **Classes CSS**: BEM ou utilitarias Tailwind
- **Variaveis JS**: camelCase
- **Commits**: Conventional Commits com prefixo do agente: `[designer] feat: add hero section layout`
- **Idioma do codigo**: Ingles
- **Idioma da comunicacao**: Portugues (BR)
