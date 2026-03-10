# 🚀 Landing Pages AI Squad

**Sistema de agentes IA para criacao de landing pages de alta conversao.**

7 agentes especializados trabalhando em conjunto no Claude Code, seguindo um pipeline de 6 fases — do briefing ao deploy. Baseado na analise de LPs reais de alta performance no mercado brasileiro.

---

## ⚡ Quick Start

### Metodo 1: Clone + Install (recomendado)

```bash
# 1. Clone o repositorio dentro do seu projeto
git clone https://github.com/Dieismy/landing-pages-ai.git .lp-squad

# 2. Execute o instalador
bash .lp-squad/install.sh .

# 3. Abra o Claude Code e comece
claude
# > @maestro *full-pipeline Crie uma LP para [sua empresa]
```

### Metodo 2: Instalacao direta

```bash
# Se voce ja tem o repo clonado:
bash /caminho/para/landing-pages-ai/install.sh /caminho/do/meu-projeto

# Ou de dentro do projeto destino:
bash /caminho/para/landing-pages-ai/install.sh .
```

### Metodo 3: npx (futuro)

```bash
npx landing-pages-ai /caminho/do/meu-projeto
```

---

## 🤖 Squad de Agentes

| Agente | Nome | Comando | Especialidade |
|--------|------|---------|---------------|
| 🎯 Maestro | Orion | `@maestro` | Orquestrador master — coordena todo o squad e garante qualidade |
| 🎨 Web Designer | Luna | `@designer` | Design visual, design tokens, identidade, layout responsivo |
| 💻 Front-End Dev | Max | `@frontend` | HTML semantico, CSS moderno, JS vanilla, GSAP, performance |
| ⚙️ Back-End Dev | Atlas | `@backend` | APIs, formularios, CRM, analytics, deploy serverless |
| ✍️ Content Writer | Sofia | `@writer` | Copy persuasivo, briefing, headlines, CTAs de alta conversao |
| 📐 UX/UI Designer | Kai | `@uxui` | Wireframe, UX research, CRO, fluxo de conversao otimizado |
| 🔍 SEO Specialist | Neo | `@seo` | SEO tecnico, schema JSON-LD, keywords, tracking (GA4 + Meta) |

---

## 📋 Pipeline de Criacao (6 Fases)

```
FASE 1 — DISCOVERY         @writer *briefing + @seo *seo-strategy
         ↓
FASE 2 — ARQUITETURA       @uxui *wireframe + @writer *write-copy + @designer *design-tokens
         ↓
FASE 3 — DESIGN VISUAL     @designer *layout + @seo *seo-technical + @writer *write-meta
         ↓
FASE 4 — IMPLEMENTACAO     @frontend *build-full + @backend *setup-forms + @backend *setup-analytics
         ↓
FASE 5 — REVIEW            @frontend *performance-audit + @seo *seo-audit + @uxui *ux-review
         ↓
FASE 6 — DEPLOY            @backend *setup-deploy
```

Cada fase tem um **gate de qualidade**. O `@maestro` coordena tudo automaticamente.

---

## 🛠️ Comandos Disponiveis

### Pipeline Completo

| Comando | Descricao |
|---------|-----------|
| `@maestro *full-pipeline [desc]` | Pipeline completo com todas as 6 fases e gates de qualidade |
| `@maestro *quick-lp [desc]` | Pipeline rapido sem gates (ideal para prototipos) |
| `@maestro *clone-lp [url]` | Analisa uma LP existente e replica estrutura/padroes |

### Pipelines Parciais

| Comando | Descricao |
|---------|-----------|
| `@maestro *only-copy [desc]` | Apenas copy (briefing + textos persuasivos) |
| `@maestro *only-design [desc]` | Apenas design (wireframe + tokens + layout) |
| `@maestro *only-code [desc]` | Apenas codigo (HTML + CSS + JS + backend) |
| `@maestro *only-seo [url]` | Apenas auditoria SEO de uma pagina existente |
| `@maestro *only-review` | Review completo (todos os agentes auditam) |

### Agentes Individuais

| Comando | Descricao |
|---------|-----------|
| `@writer *briefing` | Criar briefing do projeto |
| `@designer *design-tokens` | Gerar design tokens (cores, fontes, espacamento) |
| `@uxui *wireframe` | Criar wireframe detalhado |
| `@frontend *build-full` | Construir HTML + CSS + JS completo |
| `@backend *setup-forms` | Configurar formularios e integracoes |
| `@seo *seo-audit` | Auditoria SEO completa |

---

## 📂 Estrutura do Projeto Gerado

```
meu-projeto/
├── .claude/
│   ├── agents/              # 7 agentes do squad
│   └── settings.json        # Configuracao do Claude Code
├── CLAUDE.md                # Instrucoes e documentacao do squad
├── index.html               # Pagina principal
├── thank-you.html           # Pagina de obrigado (pos-conversao)
├── assets/
│   ├── css/
│   │   ├── tokens.css       # Design tokens (cores, fonts, spacing)
│   │   ├── base.css         # Reset, tipografia, estilos globais
│   │   ├── components.css   # Navbar, cards, forms, botoes
│   │   ├── sections.css     # Estilos por secao
│   │   ├── animations.css   # Keyframes e classes de animacao
│   │   └── utilities.css    # Helpers (sr-only, container, etc.)
│   ├── js/
│   │   ├── main.js          # App principal (nav, scroll, forms)
│   │   ├── animations.js    # GSAP + ScrollTrigger
│   │   ├── counters.js      # Contadores animados
│   │   └── tracking.js      # GA4 + Meta Pixel events
│   ├── images/
│   │   ├── hero/            # Imagens do hero
│   │   ├── logos/           # Logos de clientes (prova social)
│   │   ├── testimonials/    # Fotos de depoentes
│   │   └── icons/           # Icones SVG
│   ├── fonts/               # Fontes WOFF2
│   └── video/               # Thumbnails de video
├── api/                     # Serverless functions
├── docs/
│   └── templates/           # Templates de briefing, SEO, wireframe
└── scripts/                 # Scripts de deploy e otimizacao
```

---

## 💡 Exemplo de Uso

```bash
# 1. Crie uma pasta para seu projeto
mkdir minha-lp && cd minha-lp

# 2. Instale o squad
bash /caminho/para/landing-pages-ai/install.sh .

# 3. Abra o Claude Code
claude

# 4. Inicie o pipeline completo
# > @maestro *full-pipeline
# > Crie uma landing page para a empresa XYZ, que vende consultoria
# > de marketing digital para PMEs. Tom profissional mas acessivel.
# > Cores: azul e branco. Publico: donos de pequenas empresas.
```

O `@maestro` (Orion) vai coordenar todos os agentes automaticamente, passando por cada fase do pipeline ate entregar a LP completa e otimizada.

---

## 📊 Metricas de Qualidade (Targets)

| Metrica | Target |
|---------|--------|
| Lighthouse Performance | >= 90 |
| Lighthouse SEO | >= 95 |
| Lighthouse Accessibility | >= 90 |
| LCP | < 2.5s |
| INP | < 200ms |
| CLS | < 0.1 |
| Peso da pagina (sem imagens) | < 500KB |

---

## 🔧 Stack Tecnologico

- **HTML5** semantico com ARIA e microdata
- **CSS3** moderno (Grid, Flexbox, Custom Properties, Nesting, Container Queries)
- **JavaScript** vanilla ES2024+
- **GSAP 3.12+** com ScrollTrigger para animacoes
- **Supabase** para backend e integracoes
- **GA4 + Meta Pixel** para tracking e conversao

---

## 📄 Licenca

MIT
