# WEEK 2, DAY 1: CSS FLEXBOX - 1D LAYOUT MASTERY

## Today's Mission: Master 1-Dimensional Layouts

Today's objective was to move beyond basic styling and master **CSS Flexbox**, the modern standard for 1-dimensional layout and alignment. The goal was to understand the core concepts of flex containers and flex items, and to apply this knowledge to refactor a key component of the portfolio project.

---

## 🔑 Key Concepts & Technical Definitions

-   **Flex Container (`display: flex`):** The parent element that initiates a flex context. All direct children of this element become flex items.
-   **Flex Items:** The direct children of a flex container.
-   **Main Axis:** The primary axis along which flex items are laid out. Controlled by `flex-direction`. The default is `row` (horizontal).
-   **Cross Axis:** The axis perpendicular to the main axis.
-   **`justify-content`:** Aligns flex items along the **main axis**. It controls spacing and alignment in the direction of the flow.
-   **`align-items`:** Aligns flex items along the **cross axis**. It controls alignment perpendicular to the direction of the flow.
-   **`gap`:** A modern property used on the flex container to define the space *between* flex items, replacing the need for margins on the items themselves.

---

## 🏆 Practical Application: Refactoring the Portfolio Header

The primary practical task was to refactor the portfolio's `<header>` component, which previously relied on default block layout and older techniques.

### The Problem:
The header content (image, name, navigation) was vertically stacked by default. The navigation links were likely using `inline-block`, which is less efficient for managing spacing.

### The Solution:
1.  **Header Container (`header .container`):**
    -   Applied `display: flex` to establish a flex context.
    -   Set `flex-direction: column` to make the main axis vertical.
    -   Used `align-items: center` to center all flex items (the image, name, and nav block) horizontally along the cross axis.

2.  **Navigation List (`header nav ul`):**
    -   Applied `display: flex` to the `<ul>` element, turning its `<li>` children into flex items arranged in a row (the default `flex-direction`).
    -   Used `gap: 1.5rem` to create consistent spacing between navigation links, eliminating the need for individual margins.

**Result:** A cleaner, more maintainable, and perfectly centered header layout achieved with modern CSS.

---

## 🧠 Core Distinction: `justify-content` vs. `align-items`

The most critical concept learned today is the relationship between `flex-direction` and the alignment properties:

-   When `flex-direction: row` (default):
    -   `justify-content` controls **horizontal** alignment (left, center, right, space-between).
    -   `align-items` controls **vertical** alignment (top, center, bottom, stretch).

-   When `flex-direction: column`:
    -   The axes flip.
    -   `justify-content` now controls **vertical** alignment.
    -   `align-items` now controls **horizontal** alignment.

Understanding this core principle is the key to mastering Flexbox.
