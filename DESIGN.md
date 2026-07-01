---
name: Visionary Digital
colors:
  surface: '#101415'
  surface-dim: '#101415'
  surface-bright: '#363a3b'
  surface-container-lowest: '#0b0f10'
  surface-container-low: '#181c1d'
  surface-container: '#1d2022'
  surface-container-high: '#272b2c'
  surface-container-highest: '#313536'
  on-surface: '#e0e3e4'
  on-surface-variant: '#ccc3d8'
  inverse-surface: '#e0e3e4'
  inverse-on-surface: '#2d3132'
  outline: '#958da1'
  outline-variant: rgba(255, 255, 255, 0.1)
  surface-tint: '#d2bbff'
  primary: '#d2bbff'
  on-primary: '#3f008e'
  primary-container: '#7c3aed'
  on-primary-container: '#ede0ff'
  inverse-primary: '#732ee4'
  secondary: '#89ceff'
  on-secondary: '#00344d'
  secondary-container: '#00a2e6'
  on-secondary-container: '#00344e'
  tertiary: '#d2bbff'
  on-tertiary: '#38255e'
  tertiary-container: '#705c99'
  on-tertiary-container: '#ede0ff'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#eaddff'
  primary-fixed-dim: '#d2bbff'
  on-primary-fixed: '#25005a'
  on-primary-fixed-variant: '#5a00c6'
  secondary-fixed: '#c9e6ff'
  secondary-fixed-dim: '#89ceff'
  on-secondary-fixed: '#001e2f'
  on-secondary-fixed-variant: '#004c6e'
  tertiary-fixed: '#eaddff'
  tertiary-fixed-dim: '#d2bbff'
  on-tertiary-fixed: '#230e48'
  on-tertiary-fixed-variant: '#4f3c76'
  background: '#101415'
  on-background: '#e0e3e4'
  surface-variant: '#313536'
  gradient-start: '#7c3aed'
  gradient-end: '#00a2e6'
  text-gradient-start: '#d2bbff'
  text-gradient-end: '#89ceff'
typography:
  headline-xl:
    fontFamily: Montserrat
    fontSize: 64px
    fontWeight: '800'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Montserrat
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '700'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: '1.0'
    letterSpacing: 0.05em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1.0'
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  margin-mobile: 16px
  margin-desktop: 64px
  gutter: 24px
  stack-sm: 12px
  stack-md: 24px
  stack-lg: 48px
  container-max: 1280px
---

## Brand & Style
The brand personality is energetic, visionary, and high-tech, targeting ambitious businesses looking for creative transformation. The aesthetic sits at the intersection of **Glassmorphism** and **High-Contrast Dark Mode**, utilizing vibrant purple-to-blue gradients against a deep, slate-colored background. 

The visual style communicates precision through "ghost borders" (low-opacity white outlines) and depth through subtle glow effects. The overall emotional response should be one of "sophisticated innovation"—reliable enough for corporate consultation, yet creative enough for a high-end production house.

## Colors
The palette is centered around a "Fidelity" dark mode. The primary brand color is a vivid Violet (#7c3aed), which pairs with a Tech Blue (#00a2e6) to form the signature background gradients. 

A secondary text gradient moves from a light lavender to a sky blue, reserved specifically for high-impact headline keywords. Backgrounds use a deep Charcoal (#101415) as the base, with tiered surface containers providing enough contrast for readability without breaking the dark-mode immersion. Use semi-transparent white borders (10% opacity) instead of traditional grays to maintain the "glass" aesthetic.

## Typography
The system uses a two-font strategy: **Montserrat** for all headlines to convey energy and geometric strength, and **Inter** for all UI, labels, and body copy to ensure maximum legibility and a modern, technical feel.

Headlines should be tight and impactful, utilizing negative letter-spacing at larger sizes. Labels often use uppercase styling with wide tracking to serve as "overlines" for section titles. Body text is kept airy with a 1.6 line height to compensate for the dark background.

## Layout & Spacing
The layout follows a **Fixed Grid** approach for desktop, centered within a 1280px container, and transitions to a fluid, high-margin model for mobile.

Vertical rhythm is established through "stack" units: 12px for tight relationships (label to headline), 24px for standard grouping (headline to body), and 48px for section separation. Sections themselves are heavily padded (96px/24rem) to allow the "visionary" background effects to breathe and prevent visual clutter.

## Elevation & Depth
Depth is created through **Tonal Layering** and **Luminous Accents** rather than traditional shadows. 
1. **Base:** The primary background (#101415).
2. **Elevated Surfaces:** Containers use #1d2022 with a 1px `ghost-border` (white at 10% opacity).
3. **Interactive Depth:** On hover, cards should increase border opacity or introduce a soft `glow-hover` effect (purple box-shadow: `0 0 32px rgba(124, 58, 237, 0.15)`).
4. **Hero Depth:** Dynamic WebGL shaders or mesh gradients sit behind content to provide an organic, shifting sense of space.

## Shapes
The shape language is consistently "Soft Rounded." Standard buttons and inputs use a 0.5rem (8px) radius. Cards and large containers use a more pronounced 24px (1.5rem) radius to feel like modern, tactile modules. Circular shapes are reserved for step indicators and icons to provide a geometric counterpoint to the rectangular grid.

## Components
- **Buttons:** 
  - *Primary:* Linear gradient background, white text, bold weight. Includes a subtle hover scale (1.05x).
  - *Secondary (Ghost):* Thin 1px white/10% border, transparent background, white text.
- **Cards:** Use `surface-container` background with `ghost-border`. Portfolio cards utilize large imagery with a bottom-aligned text gradient overlay (Black to Transparent).
- **Input Fields:** Completely transparent backgrounds with a 1px border. Focus state should highlight the border in the primary purple and add a 1px ring.
- **Icons:** Use Material Symbols with a custom 400 weight. Icons in cards should be colored with the primary purple to act as visual anchors.
- **Bento Grid:** Use a 12-column grid system for portfolio layouts, allowing items to span 4 or 8 columns to create visual interest.