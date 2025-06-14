# WEEK 2, DAY 2: CSS GRID - 2D LAYOUT MASTERY

## Today's Mission: Master 2-Dimensional Layouts

Following the mastery of 1D layouts with Flexbox, today's objective was to learn **CSS Grid**, the powerful native CSS system for creating complex, two-dimensional grid layouts. The goal was to understand its core concepts and apply them to refactor the "Skills Matrix" into a truly responsive component without relying on multiple, verbose media queries.

---

## 🔑 Key Concepts & Technical Definitions

-   **Grid Container (`display: grid`):** The parent element that establishes a grid formatting context.
-   **Grid Items:** The direct children of a grid container.
-   **Grid Lines, Tracks, and Cells:** The fundamental building blocks of a grid, defining the columns and rows.
-   **`grid-template-columns` / `grid-template-rows`:** The primary properties for defining the structure of the grid, including the number and size of tracks.
-   **`gap`:** The modern property for defining the spacing (gutter) between grid tracks.
-   **The `fr` unit:** A fractional unit that represents a fraction of the available space in the grid container.

---

## 🏆 Practical Application: Refactoring the "Skills Matrix" with a Modern Grid Recipe

The primary task was to evolve the `.skills-grid-layout` from a fixed 2-column layout into a fully responsive, modern grid.

### The Problem:
The previous implementation used a media query to switch between a 1-column and a 2-column layout. This approach is functional but not flexible; it would require additional media queries to support 3 or 4 columns on wider screens.

### The Solution: The `auto-fit` + `minmax()` Recipe
The old rules were replaced with a single, powerful declaration:

```css
.skills-grid-layout {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}
