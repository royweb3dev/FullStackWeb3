# Day 05: CSS Flexbox Layouts

## Objective

To understand and implement CSS Flexbox for creating modern, flexible, one-dimensional layouts. The goal was to refactor existing components (header navigation and skills section) from older methods (`inline-block`, CSS Grid) to use a more powerful and efficient Flexbox approach.

## Key Concepts Learned

### 1. The Flex Container

By applying `display: flex;` to a parent element (the "container"), we unlock a set of properties to control its direct children (the "items").

-   **`justify-content`**: Aligns items along the main axis (horizontally by default). We used `center` to center the navigation links.
-   **`align-items`**: Aligns items along the cross axis (vertically by default).
-   **`gap`**: A modern property used to create consistent spacing *between* items, which is superior to using `margin` on the items themselves as it avoids issues with extra space at the beginning or end of the container.
-   **`flex-wrap: wrap;`**: A crucial property that allows items to wrap onto the next line if there isn't enough space in the container. This is a key to creating responsive layouts with Flexbox.

### 2. Flex Items & Sizing

We also controlled the behavior of the items themselves, primarily using the `flex` shorthand property.

**The `flex: 1 1 45%;` Shorthand**

This single line of code, applied to the `.skill-category` items, is powerful. It breaks down as follows:
-   **`flex-grow: 1;`**: If there is extra empty space in the container, this item is allowed to "grow" to fill it. A value of `1` tells it to take up a proportional share of the available space.
-   **`flex-shrink: 1;`**: If there is not enough space in the container, this item is allowed to "shrink" smaller than its `flex-basis`.
-   **`flex-basis: 45%;`**: This is the "ideal" or starting size of the item. Before growing or shrinking, the browser tries to make the item 45% of the container's width. We chose a value slightly less than 50% to ensure that the `gap` between the two columns has space to exist.

## Implementation

-   The header navigation was refactored to use `display: flex` and `gap`, resulting in cleaner and more maintainable code than the previous `inline-block` and `margin` approach.
-   The `.skills-grid` was converted from CSS Grid to a wrapping Flexbox container. This demonstrated how Flexbox can achieve responsive two-column layouts that automatically stack to a single column on smaller viewports without needing a `@media` query.

## Result

The portfolio's layouts are now powered by a modern and robust CSS feature. The code is cleaner, more efficient, and inherently more responsive.
