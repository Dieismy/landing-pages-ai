#!/usr/bin/env bash
# ============================================================================
# Landing Pages AI Squad — Script de Instalacao
# Instala o sistema completo de agentes IA para criacao de landing pages
# ============================================================================

set -euo pipefail

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # Sem cor

# Diretorio fonte (onde este script esta)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Diretorio destino (argumento ou diretorio atual)
TARGET_DIR="${1:-.}"

# Resolver caminho absoluto do destino
if [[ "$TARGET_DIR" != /* ]]; then
  TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || echo "$(pwd)/$TARGET_DIR")"
fi

# ============================================================================
# Funcoes utilitarias
# ============================================================================

print_header() {
  echo ""
  echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║${NC}  ${BOLD}Landing Pages AI Squad${NC} — Instalador v1.0                   ${CYAN}║${NC}"
  echo -e "${CYAN}║${NC}  Sistema de agentes IA para landing pages de alta conversao  ${CYAN}║${NC}"
  echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
  echo ""
}

log_info() {
  echo -e "  ${BLUE}[INFO]${NC} $1"
}

log_success() {
  echo -e "  ${GREEN}[OK]${NC} $1"
}

log_warn() {
  echo -e "  ${YELLOW}[AVISO]${NC} $1"
}

log_error() {
  echo -e "  ${RED}[ERRO]${NC} $1"
}

log_step() {
  echo ""
  echo -e "  ${BOLD}$1${NC}"
  echo -e "  ${CYAN}─────────────────────────────────────────${NC}"
}

create_dir() {
  if [[ ! -d "$1" ]]; then
    mkdir -p "$1"
    log_success "Criado: $1"
  else
    log_warn "Ja existe: $1"
  fi
}

copy_if_not_exists() {
  local src="$1"
  local dest="$2"
  if [[ -f "$dest" ]]; then
    log_warn "Ja existe (mantido): $dest"
  else
    cp "$src" "$dest"
    log_success "Copiado: $dest"
  fi
}

copy_dir_merge() {
  local src="$1"
  local dest="$2"
  if [[ -d "$src" ]]; then
    mkdir -p "$dest"
    cp -rn "$src"/ "$dest"/ 2>/dev/null || cp -r "$src"/ "$dest"/
    log_success "Copiado: $dest/"
  else
    log_error "Fonte nao encontrada: $src"
  fi
}

# ============================================================================
# Validacoes
# ============================================================================

print_header

# Verificar se os arquivos fonte existem
if [[ ! -d "$SCRIPT_DIR/.claude/agents" ]]; then
  log_error "Arquivos fonte nao encontrados em $SCRIPT_DIR"
  log_error "Certifique-se de executar o script a partir do repositorio landing-pages-ai"
  exit 1
fi

# Criar diretorio destino se nao existir
if [[ ! -d "$TARGET_DIR" ]]; then
  log_info "Criando diretorio destino: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"
fi

log_info "Fonte: $SCRIPT_DIR"
log_info "Destino: $TARGET_DIR"

# ============================================================================
# PASSO 1: Estrutura de diretorios
# ============================================================================

log_step "Passo 1/5 — Criando estrutura de diretorios"

create_dir "$TARGET_DIR/.claude/agents"
create_dir "$TARGET_DIR/assets/css"
create_dir "$TARGET_DIR/assets/js"
create_dir "$TARGET_DIR/assets/images/hero"
create_dir "$TARGET_DIR/assets/images/logos"
create_dir "$TARGET_DIR/assets/images/testimonials"
create_dir "$TARGET_DIR/assets/images/icons"
create_dir "$TARGET_DIR/assets/fonts"
create_dir "$TARGET_DIR/assets/video"
create_dir "$TARGET_DIR/api"
create_dir "$TARGET_DIR/docs"
create_dir "$TARGET_DIR/docs/templates"
create_dir "$TARGET_DIR/docs/snapshots"
create_dir "$TARGET_DIR/scripts"
create_dir "$TARGET_DIR/components"

# ============================================================================
# PASSO 2: Copiar arquivos do squad
# ============================================================================

log_step "Passo 2/5 — Copiando arquivos do squad"

# Agentes
for agent_file in "$SCRIPT_DIR/.claude/agents/"*.md; do
  if [[ -f "$agent_file" ]]; then
    filename=$(basename "$agent_file")
    copy_if_not_exists "$agent_file" "$TARGET_DIR/.claude/agents/$filename"
  fi
done

# Settings
copy_if_not_exists "$SCRIPT_DIR/.claude/settings.json" "$TARGET_DIR/.claude/settings.json"

# Commands (slash commands para atalhos /lp:agente)
if [[ -d "$SCRIPT_DIR/.claude/commands" ]]; then
  create_dir "$TARGET_DIR/.claude/commands/lp"
  for cmd_file in "$SCRIPT_DIR/.claude/commands/lp/"*.md; do
    if [[ -f "$cmd_file" ]]; then
      filename=$(basename "$cmd_file")
      copy_if_not_exists "$cmd_file" "$TARGET_DIR/.claude/commands/lp/$filename"
    fi
  done
  log_success "Slash commands instalados (/lp:maestro, /lp:designer, etc.)"
fi

# CLAUDE.md
copy_if_not_exists "$SCRIPT_DIR/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"

# Templates
for template_file in "$SCRIPT_DIR/docs/templates/"*.md; do
  if [[ -f "$template_file" ]]; then
    filename=$(basename "$template_file")
    copy_if_not_exists "$template_file" "$TARGET_DIR/docs/templates/$filename"
  fi
done

# ============================================================================
# PASSO 3: Criar arquivos starter
# ============================================================================

log_step "Passo 3/5 — Criando arquivos starter"

# --- index.html ---
if [[ ! -f "$TARGET_DIR/index.html" ]]; then
  cat > "$TARGET_DIR/index.html" << 'INDEXHTML'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Titulo da Landing Page</title>
  <meta name="description" content="Descricao da landing page para SEO">

  <!-- Preconnect -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <!-- Critical CSS inline -->
  <style>/* Critical path CSS aqui */</style>

  <!-- Fonts -->
  <!-- <link rel="stylesheet" href="[Google Fonts URL]" media="print" onload="this.media='all'"> -->

  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/tokens.css">
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/components.css">
  <link rel="stylesheet" href="assets/css/sections.css">
  <link rel="stylesheet" href="assets/css/animations.css">
  <link rel="stylesheet" href="assets/css/utilities.css">

  <!-- Open Graph -->
  <meta property="og:title" content="Titulo da Landing Page">
  <meta property="og:description" content="Descricao para compartilhamento">
  <meta property="og:image" content="">
  <meta property="og:url" content="">
  <meta property="og:type" content="website">

  <!-- Schema JSON-LD -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Titulo da Landing Page",
    "description": "Descricao da landing page"
  }
  </script>

  <!-- Favicon -->
  <link rel="icon" href="/favicon.ico" sizes="32x32">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">
</head>
<body>
  <!-- Skip Link -->
  <a href="#main-content" class="sr-only sr-only--focusable">Ir para conteudo principal</a>

  <!-- Navbar -->
  <header id="navbar" role="banner">
    <nav aria-label="Navegacao principal">
      <!-- Logo + menu aqui -->
    </nav>
  </header>

  <!-- Main Content -->
  <main id="main-content">
    <section id="hero" aria-labelledby="hero-title">
      <h1 id="hero-title">Headline Principal da Landing Page</h1>
      <p>Subheadline com proposta de valor clara</p>
      <a href="#contact" class="btn btn--primary">CTA Principal</a>
    </section>

    <section id="trust-bar" aria-label="Clientes e parceiros">
      <!-- Logos de clientes / selos de confianca -->
    </section>

    <section id="problem" aria-labelledby="problem-title">
      <h2 id="problem-title">Problema</h2>
      <!-- Dores do publico -->
    </section>

    <section id="solution" aria-labelledby="solution-title">
      <h2 id="solution-title">Solucao</h2>
      <!-- Apresentacao da solucao -->
    </section>

    <section id="benefits" aria-labelledby="benefits-title">
      <h2 id="benefits-title">Beneficios</h2>
      <!-- Grid de beneficios -->
    </section>

    <section id="how-it-works" aria-labelledby="steps-title">
      <h2 id="steps-title">Como Funciona</h2>
      <!-- Steps numerados -->
    </section>

    <section id="testimonials" aria-labelledby="testimonials-title">
      <h2 id="testimonials-title">Depoimentos</h2>
      <!-- Carrossel de depoimentos -->
    </section>

    <section id="pricing" aria-labelledby="pricing-title">
      <h2 id="pricing-title">Planos</h2>
      <!-- Tabela de precos -->
    </section>

    <section id="faq" aria-labelledby="faq-title">
      <h2 id="faq-title">Perguntas Frequentes</h2>
      <!-- FAQ accordion -->
    </section>

    <section id="cta-final" aria-labelledby="cta-title">
      <h2 id="cta-title">Pronto para Comecar?</h2>
      <!-- CTA final com urgencia -->
    </section>

    <section id="contact" aria-labelledby="form-title">
      <h2 id="form-title">Contato</h2>
      <form id="lead-form" action="/api/submit-form" method="POST">
        <!-- Formulario de contato -->
      </form>
    </section>
  </main>

  <!-- Footer -->
  <footer role="contentinfo">
    <!-- Links, copyright, LGPD -->
  </footer>

  <!-- Sticky Mobile CTA -->
  <div class="sticky-cta" role="complementary" aria-label="Acao rapida">
    <a href="#contact" class="btn btn--primary">Fale Conosco</a>
  </div>

  <!-- Floating WhatsApp -->
  <a href="https://wa.me/SEUNUMERO" class="floating-whatsapp" aria-label="Contato WhatsApp" target="_blank" rel="noopener">
    <!-- Icone WhatsApp SVG -->
  </a>

  <!-- Scripts (defer) -->
  <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js" defer></script>
  <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js" defer></script>
  <script src="assets/js/main.js" defer></script>
  <script src="assets/js/animations.js" defer></script>
  <script src="assets/js/counters.js" defer></script>
  <script src="assets/js/tracking.js" defer></script>
</body>
</html>
INDEXHTML
  log_success "Criado: index.html"
else
  log_warn "Ja existe (mantido): index.html"
fi

# --- thank-you.html ---
if [[ ! -f "$TARGET_DIR/thank-you.html" ]]; then
  cat > "$TARGET_DIR/thank-you.html" << 'THANKYOUHTML'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Obrigado! | Nome da Empresa</title>
  <meta name="robots" content="noindex, nofollow">

  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/tokens.css">
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/components.css">

  <!-- Favicon -->
  <link rel="icon" href="/favicon.ico" sizes="32x32">

  <style>
    .thank-you {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      padding: 2rem;
      text-align: center;
    }
    .thank-you h1 {
      font-size: clamp(1.75rem, 4vw, 2.5rem);
      margin-bottom: 1rem;
    }
    .thank-you p {
      font-size: 1.125rem;
      max-width: 480px;
      margin-bottom: 2rem;
      opacity: 0.8;
    }
  </style>
</head>
<body>
  <main class="thank-you">
    <h1>Obrigado pelo seu contato!</h1>
    <p>Recebemos sua mensagem e entraremos em contato em breve. Fique atento ao seu e-mail e WhatsApp.</p>
    <a href="/" class="btn btn--primary">Voltar ao inicio</a>
  </main>

  <!-- Conversion Tracking -->
  <script>
    // GA4 conversion event
    if (typeof gtag === 'function') {
      gtag('event', 'conversion', {
        'event_category': 'form',
        'event_label': 'lead_submitted'
      });
    }

    // Meta Pixel conversion event
    if (typeof fbq === 'function') {
      fbq('track', 'Lead');
    }
  </script>
</body>
</html>
THANKYOUHTML
  log_success "Criado: thank-you.html"
else
  log_warn "Ja existe (mantido): thank-you.html"
fi

# --- tokens.css ---
if [[ ! -f "$TARGET_DIR/assets/css/tokens.css" ]]; then
  cat > "$TARGET_DIR/assets/css/tokens.css" << 'TOKENSCSS'
/* ============================================================================
   Design Tokens
   Gerado pelo @designer (Luna) — Landing Pages AI Squad

   Instrucoes: Execute @designer *design-tokens para preencher automaticamente
   ============================================================================ */

:root {
  /* --- Cores Primarias --- */
  /* --color-primary: ; */
  /* --color-primary-light: ; */
  /* --color-primary-dark: ; */

  /* --- Cores Secundarias --- */
  /* --color-secondary: ; */
  /* --color-accent: ; */

  /* --- Cores Neutras --- */
  /* --color-text: ; */
  /* --color-text-light: ; */
  /* --color-bg: ; */
  /* --color-bg-alt: ; */
  /* --color-border: ; */

  /* --- Cores Semanticas --- */
  /* --color-success: ; */
  /* --color-error: ; */
  /* --color-warning: ; */

  /* --- Tipografia --- */
  /* --font-heading: ; */
  /* --font-body: ; */
  /* --font-size-base: 1rem; */
  /* --line-height-base: 1.6; */

  /* --- Espacamento --- */
  /* --space-1: 0.25rem; */
  /* --space-2: 0.5rem; */
  /* --space-4: 1rem; */
  /* --space-8: 2rem; */
  /* --space-16: 4rem; */
  /* --space-24: 6rem; */
  /* --space-32: 8rem; */

  /* --- Bordas --- */
  /* --radius-sm: 4px; */
  /* --radius-md: 8px; */
  /* --radius-lg: 16px; */
  /* --radius-full: 9999px; */

  /* --- Sombras --- */
  /* --shadow-sm: ; */
  /* --shadow-md: ; */
  /* --shadow-lg: ; */

  /* --- Breakpoints (referencia, usar em media queries) --- */
  /* Mobile: 375px */
  /* Tablet: 768px */
  /* Desktop: 1024px */
  /* Wide: 1280px */

  /* --- Container --- */
  /* --container-max: 1200px; */
  /* --container-padding: 1rem; */

  /* --- Transicoes --- */
  /* --transition-fast: 150ms ease; */
  /* --transition-base: 300ms ease; */
  /* --transition-slow: 500ms ease; */
}
TOKENSCSS
  log_success "Criado: assets/css/tokens.css"
else
  log_warn "Ja existe (mantido): assets/css/tokens.css"
fi

# --- base.css ---
if [[ ! -f "$TARGET_DIR/assets/css/base.css" ]]; then
  cat > "$TARGET_DIR/assets/css/base.css" << 'BASECSS'
/* ============================================================================
   Base CSS — Reset + Tipografia Global
   Landing Pages AI Squad
   ============================================================================ */

/* --- Modern CSS Reset --- */
*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  scroll-behavior: smooth;
  -webkit-text-size-adjust: 100%;
  text-size-adjust: 100%;
}

body {
  min-height: 100vh;
  font-family: var(--font-body, system-ui, -apple-system, sans-serif);
  font-size: var(--font-size-base, 1rem);
  line-height: var(--line-height-base, 1.6);
  color: var(--color-text, #1a1a1a);
  background-color: var(--color-bg, #ffffff);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

img,
picture,
video,
canvas,
svg {
  display: block;
  max-width: 100%;
  height: auto;
}

input,
button,
textarea,
select {
  font: inherit;
  color: inherit;
}

button {
  cursor: pointer;
}

a {
  color: inherit;
  text-decoration: none;
}

ul,
ol {
  list-style: none;
}

h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-heading, var(--font-body, system-ui, sans-serif));
  line-height: 1.2;
  text-wrap: balance;
}

p {
  text-wrap: pretty;
  max-width: 65ch;
}

/* --- Tipografia Fluida --- */
h1 { font-size: clamp(2rem, 5vw, 3.5rem); }
h2 { font-size: clamp(1.5rem, 4vw, 2.5rem); }
h3 { font-size: clamp(1.25rem, 3vw, 1.75rem); }

/* --- Acessibilidade --- */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}

.sr-only--focusable:focus {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 9999;
  width: auto;
  height: auto;
  padding: 1rem 2rem;
  margin: 0;
  overflow: visible;
  clip: auto;
  white-space: normal;
  background: var(--color-primary, #0066cc);
  color: #fff;
  font-weight: 700;
}

/* --- Container --- */
.container {
  width: 100%;
  max-width: var(--container-max, 1200px);
  margin-inline: auto;
  padding-inline: var(--container-padding, 1rem);
}

/* --- Secoes --- */
section {
  padding-block: var(--space-16, 4rem);
}

@media (min-width: 768px) {
  section {
    padding-block: var(--space-24, 6rem);
  }
}
BASECSS
  log_success "Criado: assets/css/base.css"
else
  log_warn "Ja existe (mantido): assets/css/base.css"
fi

# --- .gitignore ---
if [[ ! -f "$TARGET_DIR/.gitignore" ]]; then
  cat > "$TARGET_DIR/.gitignore" << 'GITIGNORE'
# Dependencias
node_modules/

# Sistema
.DS_Store
Thumbs.db

# Ambiente
.env
.env.local
.env.*.local

# Logs
*.log
npm-debug.log*

# Build
dist/
build/
.cache/

# IDEs
.vscode/
.idea/
*.swp
*.swo

# Vercel / Netlify
.vercel/
.netlify/
GITIGNORE
  log_success "Criado: .gitignore"
else
  log_warn "Ja existe (mantido): .gitignore"
fi

# ============================================================================
# PASSO 4: Inicializar Git
# ============================================================================

log_step "Passo 4/5 — Inicializando Git"

cd "$TARGET_DIR"
if [[ ! -d ".git" ]]; then
  git init -q
  log_success "Repositorio Git inicializado"
else
  log_warn "Git ja inicializado"
fi

# ============================================================================
# PASSO 5: Resumo
# ============================================================================

log_step "Passo 5/5 — Instalacao concluida!"

# Contar agentes instalados
AGENT_COUNT=$(ls "$TARGET_DIR/.claude/agents/"*.md 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo -e "  ${GREEN}${BOLD}Instalacao concluida com sucesso!${NC}"
echo ""
echo -e "  ${BOLD}Resumo:${NC}"
echo -e "  - Agentes instalados: ${CYAN}${AGENT_COUNT}${NC}"
echo -e "  - Diretorio: ${CYAN}${TARGET_DIR}${NC}"
echo ""
echo -e "  ${CYAN}─────────────────────────────────────────${NC}"
echo -e "  ${BOLD}Proximos passos:${NC}"
echo ""
echo -e "  ${BOLD}1.${NC} Abra o projeto no Claude Code:"
echo -e "     ${YELLOW}cd $TARGET_DIR && claude${NC}"
echo ""
echo -e "  ${BOLD}2.${NC} Inicie o pipeline completo:"
echo -e "     ${YELLOW}@maestro *full-pipeline [descreva sua LP]${NC}"
echo ""
echo -e "  ${BOLD}3.${NC} Ou crie um site completo (ate 6 paginas):"
echo -e "     ${YELLOW}@maestro *full-site [descreva seu site]${NC}"
echo ""
echo -e "  ${BOLD}4.${NC} Ou inicie uma LP rapida:"
echo -e "     ${YELLOW}@maestro *quick-lp [descreva sua LP]${NC}"
echo ""
echo -e "  ${CYAN}─────────────────────────────────────────${NC}"
echo -e "  ${BOLD}Atalhos (digite /lp no Claude Code):${NC}"
echo ""
echo -e "  ${YELLOW}/lp:maestro${NC}   — Orion  — Orquestrador do squad"
echo -e "  ${YELLOW}/lp:designer${NC}  — Luna   — Design visual e tokens"
echo -e "  ${YELLOW}/lp:frontend${NC}  — Max    — HTML, CSS, JS, animacoes"
echo -e "  ${YELLOW}/lp:backend${NC}   — Atlas  — APIs, forms, analytics"
echo -e "  ${YELLOW}/lp:writer${NC}    — Sofia  — Copy persuasivo"
echo -e "  ${YELLOW}/lp:uxui${NC}      — Kai    — Wireframe e UX/CRO"
echo -e "  ${YELLOW}/lp:seo${NC}       — Neo    — SEO tecnico e tracking"
echo ""
echo -e "  ${CYAN}─────────────────────────────────────────${NC}"
echo -e "  Documentacao: ${YELLOW}CLAUDE.md${NC}"
echo -e "  Templates: ${YELLOW}docs/templates/${NC}"
echo ""
