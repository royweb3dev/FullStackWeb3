# Day02 HTML Structure and Semantics

## Core Concept: Semantic vs. Non-Semantic Elements

The primary task today was to structure a document using semantic HTML tags. The key difference between a non-semantic element like `<div>` and a semantic element like `<section>` or `<article>` lies in **meaning**.

### `<div>` (Non-Semantic)

- **Purpose:** A generic, meaningless container.
- **Use Case:** Its sole purpose is for grouping elements for styling (with CSS) or scripting (with JavaScript) when no other semantic element is appropriate. It provides no information to the browser or developer about the content it contains.

### `<section>`, `<article>`, `<header>`, `<nav>` (Semantic)

- **Purpose:** A specific container that describes its content.
- **Use Case:** These elements clearly define the structure of the page for both the browser and the developer.
  - `<nav>` explicitly contains navigation links.
  - `<article>` contains a self-contained piece of content that could be distributed independently (e.g., a blog post, a news story).
  - `<section>` groups together thematically-related content.
- **Benefits:**
  1.  **Accessibility:** Screen readers can use semantic tags to navigate a page more effectively.
  2.  **SEO:** Search engines can better understand the content and hierarchy of your page, potentially leading to better ranking.
  3.  **Maintainability:** The code is easier to read and understand for other developers (and your future self).
