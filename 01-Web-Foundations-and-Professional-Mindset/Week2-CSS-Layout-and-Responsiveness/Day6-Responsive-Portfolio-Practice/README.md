# WEEK 2, DAY 6: PRACTICAL APPLICATION & ADVANCED ANIMATION

## Today's Objective: Build and Animate a New Responsive Component

The primary mission was to build a new, complex component from scratch, applying all concepts from the week: Grid, Flexbox, and Media Queries. The secondary objective was to implement modern, scroll-driven animations purely with CSS.

---

## 1. Component Built: "Pricing Tiers" Section

A new `<section id="pricing">` was added to the `index.html`.

-   **Macro Layout (Grid):** A `.pricing-grid` class was created using `display: grid`. It was configured with media queries to show 3 columns on desktop, 2 on tablet, and 1 on mobile.
-   **Micro Layout (Flexbox):** Each `.pricing-card` was turned into a flex container with `flex-direction: column`. This allowed for robust internal alignment, particularly using `flex-grow: 1` on the features list to push the CTA button to the bottom, ensuring all cards in a row have a consistent button alignment regardless of content height.
-   **Advanced Styling:** Implemented a `.featured` card variant with a different border and a pseudo-element badge using `position: absolute` and `transform: rotate(45deg)`.

## 2. Implementation: Scroll-Driven Animations with CSS

The key challenge was to trigger animations only when the component scrolls into the viewport, without using JavaScript.

-   **Problem:** Standard CSS animations run on page load, making them invisible for content that is further down the page.
-   **Solution:** Implemented modern CSS animation properties.
    -   **`animation-timeline: view();`**: This property was applied to the `.pricing-card`. It changes the animation's driver from a time-based duration to the element's visibility percentage within the scrollport.
    -   **`animation-range-start/end`**: These properties were used to define the exact portion of the element's visibility that the animation should span (e.g., from 0% visible to 40% visible).
    -   **`@keyframes`**: A standard `fadeInUp` keyframe was defined to handle the `opacity` and `transform` changes.

### Final Result:
A fully responsive, multi-column pricing section where each card smoothly animates into view as the user scrolls, achieved entirely with modern CSS.
