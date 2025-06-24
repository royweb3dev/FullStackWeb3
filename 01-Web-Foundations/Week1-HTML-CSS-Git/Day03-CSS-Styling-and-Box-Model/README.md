# Day 03: CSS Styling and The Box Model

## Objective

Today's goal was to apply external styling to the portfolio's HTML structure and to practically implement the CSS Box Model. A professional, light-mode color palette was chosen to ensure a clean and modern aesthetic suitable for a technical portfolio.

## Core Concept: The Box Model

Every element on a web page is treated by the browser as a rectangular box. The Box Model describes the properties that control the size and spacing of these boxes.

-   **Content:** The area where the actual content (text, images, etc.) is displayed. Its size can be controlled by `width` and `height`.
-   **Padding:** The transparent space directly surrounding the content, *inside* the border. It provides breathing room for the content within its container.
-   **Border:** A line that is drawn around the padding and content. Its style, width, and color can be defined.
-   **Margin:** The transparent space *outside* the border. It is used to create space between an element and its neighboring elements.

### The Key Distinction: `margin` vs. `padding`

In simple terms:
-   **`padding`** is for creating space **inside** an element.
-   **`margin`** is for creating space **between** elements.

In our `styles.css`, we applied this to the `<section>` elements. The `padding: 30px;` created space for the `<h2>` and `<p>` tags within the light grey box, while the `margin-bottom: 40px;` created space between each distinct section.
