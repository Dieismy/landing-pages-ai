# Landing Pages AI Squad

## Visao Geral

Este repositorio contem um squad de agentes IA especializados em criacao de landing pages de alta conversao. Cada agente representa um profissional com 15+ anos de experiencia e trabalham em conjunto seguindo um pipeline estruturado. O sistema foi modelado a partir da analise de LPs reais de alta performance no mercado brasileiro.

## Como Usar

Este repositorio deve ser **injetado** dentro do projeto da landing page. Copie `.claude/`, `CLAUDE.md` e `docs/` para a raiz do seu projeto.

```bash
cp -r [caminho-do-repo]/.claude/ ./seu-projeto/.claude/
cp [caminho-do-repo]/CLAUDE.md ./seu-projeto/CLAUDE.md
cp -r [caminho-do-repo]/docs/ ./seu-projeto/docs/
```

Depois, chame `@maestro` no Claude Code e descreva sua LP.

## Squad de Agentes

| Agente | Nome | Arquivo | Comando | Papel |
|--------|------|---------|---------|-------|
| Maestro | Orion | `maestro.md` | `@maestro` | Orquestrador master — coordena todo o squad |
| Web Designer | Luna | `web-designer.md` | `@designer` | Design visual, tokens, identidade, layout |
| Front-End Dev | Max | `frontend-dev.md` | `@frontend` | HTML, CSS, JS, GSAP, animacoes, performance |
| Back-End Dev | Atlas | `backend-dev.md` | `@backend` | APIs, forms, CRM, analytics, deploy |
| Content Writer | Sofia | `content-writer.md` | `@writer` | Copy persuasivo, briefing, messaging |
| UX/UI Designer | Kai | `ux-ui-designer.md` | `@uxui` | Wireframe, UX, CRO, fluxo de conversao |
| SEO Specialist | Neo | `seo-specialist.md` | `@seo` | SEO tecnico, schema, keywords, tracking |

## Pipeline de Criacao (6 Fases)

```
FASE 1 — DISCOVERY        @writer *briefing + @seo *seo-strategy
FASE 2 — ARQUITETURA      @uxui *wireframe + @writer *write-copy + @designer *design-tokens
FASE 3 — DESIGN VISUAL    @designer *layout + @seo *seo-technical + @writer *write-meta
FASE 4 — IMPLEMENTACAO    @frontend *build-full + @backend *setup-forms + @backend *setup-analytics
FASE 5 — REVIEW           @frontend *performance-audit + @seo *seo-audit + @uxui *ux-review + @designer *design-review
FASE 6 — DEPLOY           @backend *setup-deploy
```

Cada fase tem um gate de qualidade. O @maestro coordena tudo automaticamente.

## Comandos Rapidos

| Comando | O que faz |
|---------|-----------|
| `@maestro *full-pipeline [desc]` | Pipeline completo (6 fases) |
| `@maestro *quick-lp [desc]` | Pipeline rapido sem gates |
| `@maestro *only-copy [desc]` | Apenas copy (@writer) |
| `@maestro *only-design [desc]` | Apenas design (@designer + @uxui) |
| `@maestro *only-code [desc]` | Apenas codigo (@frontend + @backend) |
| `@maestro *only-seo [url]` | Apenas audit SEO (@seo) |
| `@maestro *only-review` | Review completo (todos auditam) |
| `@maestro *clone-lp [url]` | Analisa uma LP existente e replica estrutura/padroes |

## Regras Globais do Squad

1. **Colaboracao obrigatoria**: Nenhum agente trabalha isolado. O output de um e input do proximo.
2. **Mobile-first**: Todo design e codigo priorizam mobile. 60%+ do trafego e mobile.
3. **Performance**: Lighthouse 90+ em TODAS as metricas. Pagina total < 500KB sem imagens.
4. **Conversao**: Cada decisao visual, de copy ou tecnica deve ser justificada pela perspectiva de conversao.
5. **Acessibilidade**: WCAG 2.1 AA. Contraste 4.5:1. Navegacao por teclado. Screen reader.
6. **SEO**: Meta tags completas, schema JSON-LD, URLs amigaveis, Core Web Vitals.
7. **LGPD**: Banner de cookies, consentimento, coleta minima de dados.
8. **Codigo limpo**: Zero dependencias desnecessarias. Vanilla > framework. Sem bloat.

## Stack Tecnologico

### Core (obrigatorio)
- **HTML5** semantico (landmarks, ARIA, microdata)
- **CSS3** moderno (Grid, Flexbox, Custom Properties, Nesting, Container Queries)
- **JavaScript** vanilla ES2024+

### Animacoes (conforme necessidade)
- **GSAP 3.12+** com ScrollTrigger — animacoes scroll-driven avancadas
- **CSS Animations/Transitions** — micro-interacoes e hover states
- **Lottie** — ilustracoes animadas (quando fornecidas)
- **View Transitions API** — transicoes de pagina nativas

### Componentes Interativos
- **Swiper.js** — carrosseis (logos infinito, depoimentos, cases)
- **intl-tel-input** — campo telefone internacional com DDD
- **reCAPTCHA v3** — protecao anti-spam invisivel
- **Alpine.js** — reatividade leve (FAQ accordion, tabs, modais)

### Backend & Integracoes
- **Supabase** — banco de dados, auth, edge functions (padrao)
- **n8n** — automacoes e workflows
- **Vercel/Netlify** — deploy e serverless functions
- **GA4 + GTM** — analytics
- **Meta Pixel + CAPI** — tracking de conversao

### Formatos de Assets
- **Imagens**: WebP/AVIF (fallback PNG/JPG), lazy loading nativo
- **Fontes**: WOFF2, font-display: swap, subset para caracteres usados
- **Icones**: SVG inline ou sprite sheet
- **Videos**: Embed YouTube/Vimeo lazy (facade pattern)

## Estrutura do Projeto Gerado

```
projeto-lp/
├── .claude/
│   ├── agents/              # Agentes do squad (injetados deste repo)
│   └── settings.json
├── CLAUDE.md                # Este arquivo
├── index.html               # Pagina principal
├── thank-you.html           # Pagina de obrigado (pos-conversao)
├── assets/
│   ├── css/
│   │   ├── tokens.css       # Design tokens (cores, fonts, spacing)
│   │   ├── base.css         # Reset, tipografia, estilos globais
│   │   ├── components.css   # Navbar, hero, cards, forms, footer
│   │   ├── sections.css     # Estilos especificos por secao
│   │   ├── animations.css   # Keyframes e classes de animacao
│   │   └── utilities.css    # Helpers (sr-only, container, etc.)
│   ├── js/
│   │   ├── main.js          # App principal (nav, scroll, forms)
│   │   ├── animations.js    # GSAP + ScrollTrigger setup
│   │   ├── counters.js      # Contadores animados
│   │   ├── carousel.js      # Swiper configs
│   │   └── tracking.js      # GA4 + Meta Pixel events
│   ├── images/
│   │   ├── hero/
│   │   ├── logos/           # Logos de clientes (prova social)
│   │   ├── testimonials/    # Fotos de depoentes
│   │   └── icons/           # Icones SVG
│   ├── fonts/
│   └── video/               # Thumbnails de video (facade)
├── api/                     # Serverless functions
│   ├── submit-form.js       # Processamento de formulario
│   └── webhook.js           # Webhook para CRM/n8n
├── docs/
│   ├── briefing.md          # Briefing do projeto
│   ├── seo-strategy.md      # Estrategia SEO
│   ├── wireframe.md         # Wireframe e fluxo UX
│   └── copy-deck.md         # Todo o conteudo textual
└── scripts/
    ├── optimize-images.sh   # Script de otimizacao de imagens
    └── deploy.sh            # Script de deploy
```

## Componentes Reutilizaveis (Biblioteca)

Componentes padrao que aparecem em 90%+ das LPs analisadas:

| Componente | Descricao | Referencia |
|------------|-----------|------------|
| `navbar-sticky` | Navbar fixa com transparencia que fica solida ao scroll | Renke Studio |
| `hero-split` | Hero com texto esquerda + imagem/video direita | Padrao B2B |
| `hero-centered` | Hero centralizado com CTA grande | V4 Company |
| `logo-carousel` | Carrossel infinito de logos de clientes (auto-play) | Renke (47 logos) |
| `trust-bar` | Barra horizontal com logos/selos de parceiros | V4 (Google/Meta Partner) |
| `pain-points` | Cards com dores/problemas do publico | Clinic 5P |
| `benefits-grid` | Grid 2x3 ou 3x2 com icone + titulo + descricao | Todos os 3 sites |
| `how-it-works` | Steps numerados (3-5 etapas) com setas | V4 Company |
| `testimonials-video` | Carrossel de depoimentos em video | Renke Studio |
| `testimonials-card` | Cards com foto, nome, cargo, texto | V4 Company |
| `testimonials-image` | Carrossel de prints/screenshots de depoimentos | Renke Studio |
| `pricing-table` | Tabela de planos (Basic/Pro/Advanced) com destaque | V4 + Clinic 5P |
| `animated-counters` | Numeros que contam ao entrar no viewport | Todos os 3 sites |
| `faq-accordion` | Perguntas frequentes com expand/collapse | Renke Studio |
| `contact-form` | Formulario com intl-tel, validacao, reCAPTCHA | Renke Studio |
| `qualified-form` | Formulario com selects de qualificacao | Clinic 5P |
| `cta-section` | Secao final com headline de urgencia + CTA grande | Todos os 3 sites |
| `sticky-mobile-cta` | Barra fixa no bottom mobile com CTA | Padrao mobile |
| `newsletter-signup` | Mini-form de newsletter (nome + email) | Renke Studio |
| `video-facade` | Thumbnail de video que carrega player sob demanda | Performance |
| `scroll-reveal` | Animacao fade-in/slide-up ao scroll (GSAP) | Renke Studio |
| `floating-whatsapp` | Botao flutuante de WhatsApp | Padrao BR |
| `before-after-gallery` | Grid de fotos antes/depois (casos clinicos) | IRO Odontologia |
| `services-gallery` | Grid de imagens com hover overlay + titulo do servico | Dra. Camila Rotta |
| `doctor-bio` | Secao sobre o profissional: foto + bio + credenciais | Dra. Camila Rotta |
| `map-embed` | Mapa de localizacao embed (Google Maps / Leaflet) | Dra. Camila Rotta |
| `hero-fullscreen` | Hero fullscreen com video/imagem de fundo + overlay escuro | IRO Odontologia |
| `timeline-roi` | Timeline de implementacao com indicadores de ROI progressivo | Clinica 10x |
| `dual-plan-cards` | Comparacao de 2 planos lado a lado com destaque | Clinica 10x |
| `speaker-authority` | Grid de fotos em eventos/palestras (autoridade) | Clinica 10x |
| `case-gallery` | Grid de screenshots de resultados + logos de clientes | Clinica 10x |
| `qualified-form-advanced` | Form com 8+ campos incluindo selects de especialidade e faturamento | Clinica 10x |
| `problem-narrative` | Secao de dor em formato narrativo com perguntas reflexivas | Clinica 10x |
| `exclusivity-badge` | Badge de exclusividade/filtro ("Exclusivo para clinicas que faturam acima de R$200k") | Clinica 10x |
| `testimonials-google` | Cards de depoimentos do Google (estrelas + nome + data + texto) | Dra. Camila Rotta |
| `section-divider-accent` | Linhas decorativas coloridas separando secoes | IRO + Clinica 10x |
| `gold-accent-design` | Design premium com acentos dourados/gold em fundo escuro | IRO Odontologia |

## Padroes Visuais por Segmento (Estetica & Saude)

LPs do segmento de estetica e saude possuem padroes visuais especificos:

### Clinicas de Estetica / Dermatologia
- **Paleta**: Tons neutros (bege, nude, off-white) + acentos dourados ou rose
- **Tipografia**: Fontes serifadas elegantes para headings (Playfair, DM Serif), sans-serif clean para body
- **Fotos**: Retratos profissionais do medico, antes/depois de procedimentos, close-ups de pele/rosto
- **Layout**: Espacoso, muito whitespace, secoes amplas com respiro visual
- **Elementos**: Linhas finas decorativas, formas organicas, overlays translucidos
- **Referencia**: Dra. Camila Rotta — bege (#C5A882) + branco + serif headings

### Clinicas Odontologicas Premium
- **Paleta**: Preto/dark + dourado/gold (#D4A853) — transmite premium e exclusividade
- **Tipografia**: Sans-serif bold para headings, contraste extremo (branco no escuro)
- **Fotos**: Close-ups de sorrisos, antes/depois, fotos do profissional em ambiente premium
- **Layout**: Full-width sections, fundos escuros alternando com claros, bordas douradas
- **Elementos**: Gradientes gold, linhas decorativas douradas, icones flat dourados
- **Referencia**: IRO Odontologia — preto + dourado (#FFD103) + fotos em grid

### Agencias de Marketing para Clinicas (B2B Saude)
- **Paleta**: Amarelo/gold accent (#FFD103) + preto/escuro — energia e profissionalismo
- **Tipografia**: Sans-serif moderna, tamanhos grandes, bold
- **Fotos**: Equipe, palcos, logos de clientes, prints de resultados
- **Layout**: Denso em informacao, muitas secoes, prova social pesada
- **Elementos**: Badges de exclusividade, timelines, contadores grandes, carrosseis multiplos
- **Referencia**: Clinica 10x — amarelo + preto + narrative copy + 17 secoes

## Padroes de Animacao (GSAP + ScrollTrigger)

Animacoes padrao usadas nas LPs de referencia:

```
scroll-fade-up    → Elemento sobe 30px com fade-in ao entrar no viewport
scroll-fade-left  → Elemento entra da esquerda com fade
scroll-fade-right → Elemento entra da direita com fade
scroll-scale      → Elemento escala de 0.8 para 1.0
stagger-children  → Filhos aparecem em sequencia (delay 0.1s entre cada)
counter-up        → Numero conta de 0 ate o valor final
logo-scroll       → Carrossel infinito CSS (sem JS) com animacao linear
hero-entrance     → Headline + subheadline + CTA aparecem em cascata
parallax-bg       → Background move mais lento que o conteudo
text-highlight    → Palavra-chave destaca com cor/underline ao scroll
navbar-shrink     → Navbar reduz padding e ganha background ao scroll
```

## Convencoes de Codigo

- **Arquivos**: kebab-case (`hero-section.css`, `animated-counters.js`)
- **Classes CSS**: BEM (`block__element--modifier`) ou utilitarias
- **Custom Properties**: `--color-primary`, `--space-8`, `--font-heading`
- **Variaveis JS**: camelCase (`scrollPosition`, `formData`)
- **Funcoes JS**: camelCase (`initCarousel()`, `handleFormSubmit()`)
- **Commits**: `[agente] tipo: descricao` (`[frontend] feat: add hero section with GSAP animations`)
- **Idioma do codigo**: Ingles
- **Idioma da comunicacao e docs**: Portugues (BR)

## Metricas de Qualidade (Obrigatorio)

| Metrica | Target | Ferramenta |
|---------|--------|------------|
| Lighthouse Performance | >= 90 | Chrome DevTools |
| Lighthouse SEO | >= 95 | Chrome DevTools |
| Lighthouse Accessibility | >= 90 | Chrome DevTools |
| Lighthouse Best Practices | >= 90 | Chrome DevTools |
| LCP | < 2.5s | Web Vitals |
| INP | < 200ms | Web Vitals |
| CLS | < 0.1 | Web Vitals |
| Page Weight (sem imagens) | < 500KB | DevTools Network |
| Page Weight (total) | < 2MB | DevTools Network |
| Mobile-friendly | Pass | Google Mobile Test |
| Schema validation | Zero errors | Rich Results Test |
| HTML validation | Zero errors | W3C Validator |
