# Wireframe — [Nome do Projeto]

## Configuracoes Gerais

- **Layout**: Single page
- **Abordagem**: Mobile-first
- **Breakpoints**: 320px | 768px | 1024px | 1440px
- **Max-width conteudo**: 1200px
- **Navbar**: [ ] Fixa | [ ] Transparente | [ ] Com CTA

---

## Secoes

### 1. Navbar
```
[ Logo ]                    [ Menu Items ] [ CTA Button ]
```
- **Comportamento**: Fixa no topo, background solido ao scrollar
- **Mobile**: Hamburger menu
- **CTA no header**: Sim/Nao

### 2. Hero Section
**Layout escolhido**: [ ] Split | [ ] Centralizado | [ ] Video BG

```
+--------------------------------------------------+
|                                                    |
|  [Badge/Tag]                        [Imagem/      |
|  [Headline H1]                      Video/        |
|  [Subheadline]                      Ilustracao]   |
|  [CTA Principal] [CTA Secundario]                 |
|  [Social proof mini: logos/numeros]               |
|                                                    |
+--------------------------------------------------+
```
- **Animacao**: Fade-in no load
- **CTA principal**: Texto / Cor / Acao

### 3. Barra de Prova Social (opcional)
```
+--------------------------------------------------+
| "Confiado por:" [Logo] [Logo] [Logo] [Logo]      |
+--------------------------------------------------+
```

### 4. Problema / Dor
```
+--------------------------------------------------+
|  [H2: Headline do problema]                       |
|  [Descricao: identificacao com a dor]             |
|  [3 cards com dores especificas]                  |
+--------------------------------------------------+
```

### 5. Solucao / Beneficios
```
+--------------------------------------------------+
|  [H2: Headline da solucao]                        |
|  [Grid 2x3 ou 3x2 com beneficios]               |
|  Cada card: [Icone] [Titulo] [Descricao curta]   |
|  [CTA secundario]                                 |
+--------------------------------------------------+
```

### 6. Como Funciona
```
+--------------------------------------------------+
|  [H2: Como funciona]                              |
|  [Step 1] → [Step 2] → [Step 3]                 |
|  Cada step: [Numero] [Titulo] [Descricao]        |
+--------------------------------------------------+
```

### 7. Prova Social / Depoimentos
```
+--------------------------------------------------+
|  [H2: O que dizem nossos clientes]               |
|  [Card depoimento 1] [Card 2] [Card 3]          |
|  Cada card: [Foto] [Nome] [Cargo] [Texto]        |
|  [Numeros de impacto em destaque]                 |
+--------------------------------------------------+
```

### 8. Pricing / Oferta (se aplicavel)
```
+--------------------------------------------------+
|  [H2: Oferta]                                     |
|  [Card de preco com destaque]                     |
|  [Lista de incluso]                               |
|  [Garantia]                                       |
|  [CTA com urgencia]                               |
+--------------------------------------------------+
```

### 9. FAQ
```
+--------------------------------------------------+
|  [H2: Perguntas frequentes]                       |
|  [Accordion: Pergunta 1] [+]                     |
|  [Accordion: Pergunta 2] [+]                     |
|  [Accordion: Pergunta 3] [+]                     |
+--------------------------------------------------+
```

### 10. CTA Final
```
+--------------------------------------------------+
|  [H2: Headline com urgencia]                      |
|  [Subheadline reforçando beneficio]               |
|  [CTA Grande e destacado]                         |
|  [Garantia / Sem compromisso]                     |
+--------------------------------------------------+
```

### 11. Footer
```
+--------------------------------------------------+
|  [Logo] [Links uteis] [Contato] [Social]         |
|  [Copyright] [Politica de Privacidade] [Termos]  |
+--------------------------------------------------+
```

---

## Interacoes e Comportamentos

| Elemento | Comportamento | Trigger |
|----------|--------------|---------|
| Navbar | Sticky + solid bg | Scroll > 50px |
| Secoes | Fade-in | Scroll into view |
| CTAs | Hover scale + shadow | Mouse hover |
| FAQ | Accordion expand | Click |
| Forms | Inline validation | On blur |
| Mobile CTA | Sticky bottom bar | Scroll past hero |

## Notas UX
-
