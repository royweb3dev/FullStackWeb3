# Day 03: CSS Styling, Box Model, and Professional Palettes

## Objective

To apply external styling to the portfolio's HTML structure, implement the CSS Box Model, and establish a professional visual theme. This involved selecting a clean, readable color palette and restructuring the "Core Competencies" section for better organization and professional representation.

## Key Learnings & Concepts

### 1. External CSS & Separation of Concerns

An external stylesheet (`styles.css`) was linked to the HTML using the `<link>` tag. This separates structure (HTML) from presentation (CSS), a core principle of modern web development that improves maintainability.

### 2. The CSS Box Model

Every HTML element is a box. The key properties controlling its layout were implemented:
-   **`content`**: The text or image itself.
-   **`padding`**: The space *inside* the border, between the content and the border. Used to give content "breathing room."
-   **`border`**: The line drawn *around* the padding. Used to visually define the box's edge.
-   **`margin`**: The space *outside* the border, separating the element from its neighbors.

### 3. Professional Theming with CSS Variables

A professional "light mode" color scheme was implemented. Key colors were defined as CSS Custom Properties (variables) in the `:root` selector (e.g., `--accent-color: #007BFF;`). This practice makes the theme easily maintainable and consistent across the entire site.

## Implementation Details

-   **Layout:** A main `.container` class was implemented in the HTML and styled in CSS to enforce a consistent maximum width and centered layout for all page sections.
-   **Styling:** Base styles for typography, links, and section backgrounds were defined.
-   **Skills Section Restructure:** The "Core Competencies" section was refactored in the HTML to use `<article>` tags within a parent `div`. CSS Grid (`display: grid`) was then applied to create a responsive, multi-column layout, which is a more advanced and professional way to display this information.
-   **Alignment Fix:** `text-align` properties were adjusted to ensure that section titles (`<h2>`) are centered, while their content (paragraphs and lists) remains left-aligned for optimal readability.

## Result

The portfolio now has a clean, modern, and professional visual appearance. The layout is consistent, text is readable, and the color scheme reflects a technical aesthetic. The project is a solid foundation for future development.