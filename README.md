# Nuke Design System

**Three complete design systems in one CSS framework.**

Ship zen, soft, or solid. Or all three. Your choice.

```html
<!-- Minimal Japanese aesthetic -->
<button style="zen">Click me</button>

<!-- Modern subtle contrasts -->
<button style="soft">Click me</button>

<!-- Traditional clear boundaries -->
<button style="solid">Click me</button>
```

---

## The Breakthrough

**Most design systems give you variants.** Nuke gives you **three complete, cohesive design philosophies.**

Pick one style attribute. Get a full design language across all 22 elements and 6 components.

### zen - Minimal / Japanese Aesthetic

Lean, understated, maximum whitespace. Borders used sparingly, no shadows, transparent backgrounds.

- Text inputs: Bottom border only (underline)
- Checkboxes: 1px border, no fill
- Buttons: Minimal styling, subtle hover states
- Overall: Maximum whitespace, minimal visual weight

**Think:** Brutalism, Japanese design, text-heavy interfaces

### soft - Subtle Contrasts

Modern, background-driven, no hard edges. Visual guidance through backgrounds only.

- NO borders anywhere across elements
- Soft shadows for depth
- Backgrounds create structure
- Overall: Airy, gentle, contemporary

**Think:** iOS, modern web apps, soft aesthetics

### solid - All In

Traditional, clear boundaries, maximum definition. Borders AND backgrounds together.

- Strong shadows
- Clear visual boundaries everywhere
- Maximum clarity
- Overall: Nothing ambiguous

**Think:** Material Design, Bootstrap, enterprise apps

---

## Why This Is Unique

### Same Attribute, Complete Philosophy

```html
<!-- zen philosophy across all elements -->
<button style="zen">Save</button>
<input style="zen" type="text" placeholder="Name">
<nuke-card style="zen">
  <nuke-card-header>Title</nuke-card-header>
  <nuke-card-content>Content follows the same zen aesthetic</nuke-card-content>
</nuke-card>
```

**Every element follows the same design language per style name.**

Not arbitrary variants. **Cohesive design systems.**

### Three Approaches to Ship

1. **Pick one philosophy** - Use `style="zen"` everywhere for consistent aesthetic
2. **Mix strategically** - zen forms, solid buttons, soft navigation
3. **Extend with your own** - Add `.style-4` and define your complete design system

### Backward Compatible

```html
<!-- New syntax (recommended) -->
<button style="zen">Click me</button>

<!-- Also works with class -->
<button class="zen">Click me</button>

<!-- Legacy numeric syntax still works -->
<button style="1">Click me</button>
<button class="style-1">Click me</button>
```

---

## Features

- **3 complete design systems** - zen, soft, solid (not just variants)
- **Element-first** - Native HTML works without classes
- **22 styled elements** - Buttons, forms, tables, navigation, and more
- **6 web components** - Card, toolbar, badge, tabs, toast, sidebar
- **Fully customizable** - CSS variables for everything
- **No build tools** - Just CSS files (+ optional JS for web components)
- **Framework agnostic** - Works with React, Vue, Angular, or plain HTML
- **Accessible** - ARIA roles, keyboard navigation, focus states

---

## Installation

```bash
npm install @nuke.dev/design-system
```

The postinstall script will ask where you want your theme folder (recommended: `./nuke-theme/`).

---

## Quick Start

### 1. Import CSS (in this order)

```css
/* Import theme FIRST (customizable variables) */
@import '@nuke.dev/design-system/core/theme.css';

/* Then import system logic */
@import '@nuke.dev/design-system/core/core.css';
```

### 2. Optional: Import Web Components

```html
<!-- In your HTML -->
<script type="module" src="node_modules/@nuke.dev/design-system/components/core.js"></script>
```

Or in your JavaScript:

```javascript
import '@nuke.dev/design-system/components/core.js';
```

### 3. Use It!

```html
<!-- Pick your design philosophy -->
<button style="zen">Minimal</button>
<button style="soft">Modern</button>
<button style="solid">Traditional</button>

<!-- Works with all elements -->
<input style="zen" type="text" placeholder="Zen input">
<input style="soft" type="text" placeholder="Soft input">
<input style="solid" type="text" placeholder="Solid input">

<!-- Web components too -->
<nuke-card style="zen">
  <nuke-card-header>Zen Card</nuke-card-header>
  <nuke-card-content>Minimal aesthetic throughout</nuke-card-content>
</nuke-card>
```

---

## The Philosophy System

**Every element respects the same design philosophy per style name.**

### zen Elements

```html
<!-- Forms -->
<input style="zen" type="text" placeholder="Underline only">
<textarea style="zen" placeholder="Minimal borders"></textarea>
<select style="zen">
  <option>Choose</option>
</select>

<!-- Buttons -->
<button style="zen">Subtle hover</button>

<!-- Checkboxes/Radios -->
<input style="zen" type="checkbox"> <!-- 1px border, no fill -->
<input style="zen" type="radio"> <!-- Minimal style -->

<!-- Components -->
<nuke-card style="zen">Maximum whitespace</nuke-card>
<nuke-badge style="zen">Text-only</nuke-badge>
```

### soft Elements

```html
<!-- Forms (no borders anywhere) -->
<input style="soft" type="text" placeholder="Background only">
<textarea style="soft" placeholder="No hard edges"></textarea>
<select style="soft">
  <option>Choose</option>
</select>

<!-- Buttons -->
<button style="soft">Soft shadows</button>

<!-- Checkboxes/Radios -->
<input style="soft" type="checkbox"> <!-- Filled, no border -->
<input style="soft" type="radio"> <!-- Smooth circles -->

<!-- Components -->
<nuke-card style="soft">Gentle depth</nuke-card>
<nuke-badge style="soft">Subtle background</nuke-badge>
```

### solid Elements

```html
<!-- Forms (borders + backgrounds) -->
<input style="solid" type="text" placeholder="Clear boundaries">
<textarea style="solid" placeholder="Maximum clarity"></textarea>
<select style="solid">
  <option>Choose</option>
</select>

<!-- Buttons -->
<button style="solid">Strong shadows</button>

<!-- Checkboxes/Radios -->
<input style="solid" type="checkbox"> <!-- Border + fill -->
<input style="solid" type="radio"> <!-- Clear circles -->

<!-- Components -->
<nuke-card style="solid">Defined edges</nuke-card>
<nuke-badge style="solid">Bold presence</nuke-badge>
```

---

## Available Elements

### Form Controls (10)
- `button` - zen/soft/solid buttons
- `input` - Text, email, password, etc. (zen: underline, soft: filled, solid: bordered)
- `select` - Custom dropdown
- `textarea` - zen/soft/solid text areas
- `checkbox` - zen/soft/solid checkboxes
- `radio` - zen/soft/solid radio buttons
- `label` - Bold/uppercase/colored
- `progress` - Solid/striped/rounded
- `meter` - Semantic coloring
- `range` - Slider with variants

### Navigation (2)
- `a` - Links with hover states
- `nav` - Horizontal/bar/vertical

### Interactive (2)
- `dialog` - Native modal
- `details` - Accordion/disclosure

### Content (1)
- `table` - Striped/bordered/minimal

### Lists (2)
- `ul` - Unordered lists
- `ol` - Ordered lists

### Text/Code (3)
- `hr` - Horizontal rules
- `code` - Inline code
- `pre` - Code blocks

### Media (1)
- `img` - Images with borders

---

## Web Components

### Card
```html
<nuke-card style="zen">
  <nuke-card-header>Title</nuke-card-header>
  <nuke-card-content>
    Your content here
  </nuke-card-content>
  <nuke-card-actions>
    <button>Cancel</button>
    <button style="zen">Save</button>
  </nuke-card-actions>
</nuke-card>
```

**Styles:** zen (minimal), soft (elevated), solid (bordered)

### Toolbar
```html
<nuke-toolbar style="soft">
  <button>New</button>
  <button>Edit</button>
  <button>Delete</button>
</nuke-toolbar>
```

**Styles:** zen (minimal), soft (standard), solid (bordered)

### Badge
```html
<nuke-badge style="zen">New</nuke-badge>
<nuke-badge style="soft">12</nuke-badge>
<nuke-badge style="solid">Beta</nuke-badge>
```

**Styles:** zen (text-only), soft (subtle), solid (bold)

### Tabs
```html
<nuke-tabs>
  <nuke-tab>Tab 1</nuke-tab>
  <nuke-tab>Tab 2</nuke-tab>
  <nuke-tab-panel>Content 1</nuke-tab-panel>
  <nuke-tab-panel>Content 2</nuke-tab-panel>
</nuke-tabs>
```

**Features:** Arrow key navigation, Home/End keys, full ARIA support

### Toast
```html
<button onclick="showToast('Hello!')">Show Toast</button>

<script>
  function showToast(message) {
    const toast = document.createElement('nuke-toast');
    toast.setAttribute('style', 'soft');
    toast.textContent = message;
    document.body.appendChild(toast);
  }
</script>
```

**Features:** Auto-dismiss, slide animations, stacking

### Sidebar
```html
<nuke-sidebar>
  <nav>
    <a href="#home">Home</a>
    <a href="#about">About</a>
    <a href="#contact">Contact</a>
  </nav>
</nuke-sidebar>

<button onclick="document.querySelector('nuke-sidebar').open()">
  Open Sidebar
</button>
```

**Features:** Slide animations, overlay backdrop, collapsible

---

## Customization

All design tokens are CSS variables in your `nuke-theme/` folder:

### Colors
```css
/* nuke-theme/base/colors.css */
:root {
  --color-1: hsl(210, 60%, 50%);    /* Primary */
  --color-2: hsl(280, 60%, 55%);    /* Secondary */
  --color-3: hsl(160, 60%, 45%);    /* Accent */

  --background-1: hsl(0, 0%, 99%);  /* Page bg */
  --background-2: hsl(0, 0%, 100%); /* Card bg */
}
```

### Spacing
```css
/* nuke-theme/base/spacing.css */
:root {
  --space-1: 0.5rem;  /* 8px */
  --space-2: 1rem;    /* 16px */
  --space-3: 2rem;    /* 32px */
  --space-4: 3rem;    /* 48px */
}
```

### Philosophy-Specific Variables
```css
/* nuke-theme/elements/button.css */
:root {
  /* Base button properties */
  --button-height: var(--height-2);
  --button-padding-x: var(--space-2);
  --button-radius: var(--border-radius);

  /* zen philosophy */
  --button-zen-bg: transparent;
  --button-zen-color: var(--on-background);
  --button-zen-hover-bg: var(--background-3);

  /* soft philosophy */
  --button-soft-bg: var(--background-3);
  --button-soft-color: var(--on-background);
  --button-soft-shadow: var(--shadow-1);

  /* solid philosophy */
  --button-solid-bg: var(--color-1);
  --button-solid-color: var(--on-color);
  --button-solid-border: var(--border-2);
}
```

**Edit any variable to customize your design system!**

---

## Mixing Philosophies

You're not locked into one philosophy. Mix strategically:

```html
<!-- zen forms for minimal data entry -->
<form>
  <input style="zen" type="text" placeholder="Email">
  <input style="zen" type="password" placeholder="Password">

  <!-- solid button for clear action -->
  <button style="solid">Sign In</button>
</form>

<!-- soft navigation for gentle guidance -->
<nav style="soft">
  <a href="#home">Home</a>
  <a href="#about">About</a>
</nav>

<!-- zen cards for content focus -->
<nuke-card style="zen">
  <nuke-card-content>
    Content is the focus, not the container.
  </nuke-card-content>
</nuke-card>
```

**The power is in having three complete, cohesive systems to choose from.**

---

## CI/CD

The postinstall script automatically skips in CI environments:

```bash
# Or manually skip
NUKE_SKIP_SETUP=true npm install
```

## Re-run Setup

```bash
npx @nuke.dev/design-system setup
```

---

## Philosophy

**Element-first, not class-first:**
- Native HTML works without classes
- Add `style="zen/soft/solid"` only when you need a specific philosophy
- No utility class spam (not like Tailwind)
- No component class bloat (not like Bootstrap)

**Three complete design systems:**
- zen = minimal/Japanese aesthetic
- soft = modern/subtle contrasts
- solid = traditional/clear boundaries
- Pick one, mix strategically, or extend with your own

**Native APIs first:**
- Use `<dialog>` for modals
- Use `<details>` for accordions
- Web components only when structure matters

**Core/Theme separation:**
- Update system logic safely (core)
- Your customizations never overwritten (theme)
- One folder per concern

---

## Framework Integration

### React
```jsx
import '@nuke.dev/design-system/components/core.js';

function App() {
  return (
    <nuke-card style="zen">
      <nuke-card-header>React + Nuke</nuke-card-header>
      <nuke-card-content>
        <button className="zen">Click me</button>
      </nuke-card-content>
    </nuke-card>
  );
}
```

### Vue
```vue
<template>
  <nuke-card style="soft">
    <nuke-card-header>Vue + Nuke</nuke-card-header>
    <nuke-card-content>
      <button class="soft">Click me</button>
    </nuke-card-content>
  </nuke-card>
</template>

<script setup>
import '@nuke.dev/design-system/components/core.js';
</script>
```

### Angular
```typescript
// app.config.ts
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';

export const appConfig = {
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
};
```

```typescript
// main.ts
import '@nuke.dev/design-system/components/core.js';
```

```html
<!-- component.html -->
<nuke-card style="solid">
  <nuke-card-header>Angular + Nuke</nuke-card-header>
  <nuke-card-content>
    <button class="solid">Click me</button>
  </nuke-card-content>
</nuke-card>
```

---

## Browser Support

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Modern mobile browsers

**Requires:** ES6 modules support (for web components)

---

## What Makes Nuke Different

**Not variants. Complete design systems.**

Other frameworks give you `.button-primary`, `.button-outlined`, `.button-ghost` with no relationship between them.

Nuke gives you three complete, cohesive design philosophies:
- **zen** - Every element follows minimal Japanese aesthetic
- **soft** - Every element follows modern subtle design
- **solid** - Every element follows traditional clear boundaries

**Same attribute name everywhere. Complete visual coherence per philosophy.**

This is unique. Nobody else ships three complete design systems in one framework.

---

## License

MIT

---

## Links

- **Repository:** [github.com/c-heer/nuke-design-system](https://github.com/c-heer/nuke-design-system)
- **Issues:** [Report a bug](https://github.com/c-heer/nuke-design-system/issues)
- **npm:** [@nuke.dev/design-system](https://www.npmjs.com/package/@nuke.dev/design-system)

---

**Built by [@c-heer](https://github.com/c-heer)** | Three design systems. One framework. Your choice.
