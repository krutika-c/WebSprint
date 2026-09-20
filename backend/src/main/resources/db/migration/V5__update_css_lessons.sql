-- Updates CSS lesson content only (content_markdown on the `lessons` table).
-- Does NOT touch `questions` or `question_options` — quiz data is unchanged.

-- Level 1: Welcome to CSS – Styling Your First Web Page
UPDATE lessons les
SET content_markdown = '## Concept

### What is CSS?

CSS stands for Cascading Style Sheets. HTML defines the structure and content of a webpage, while CSS controls how that content looks. CSS can change colors, fonts, spacing, borders, and the overall visual presentation.

### How CSS Works

CSS selects one or more HTML elements and applies declarations to them. A declaration contains a property and a value, such as color: blue;. The browser reads these rules and applies the resulting styles to the matching elements.

### A Basic CSS Rule

A simple ruleset contains a selector followed by a declaration block. For example:

h1 {
  color: blue;
}

Here, h1 is the selector, color is the property, and blue is the value.

### CSS Comments

CSS comments are written between /* and */. They are ignored by the browser and can be used to explain sections of a stylesheet or temporarily disable a declaration.

### Why CSS Matters

Without CSS, webpages are largely presented using the browser''s default styling. CSS makes interfaces readable, visually consistent, and easier to maintain.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 1;

-- Level 2: Connecting CSS to HTML
UPDATE lessons les
SET content_markdown = '## Concept

### Inline CSS

Inline CSS is written directly in an element''s style attribute, for example <p style="color:red;">Hello</p>. It is useful for a very local style but can become difficult to maintain when used repeatedly.

### Internal CSS

Internal CSS is written inside a <style> element, normally in the document''s <head>. It can style elements on one HTML page without creating a separate stylesheet.

### External CSS

External CSS is stored in a separate .css file and connected using <link rel="stylesheet" href="style.css">. This keeps structure and presentation separate and allows the same stylesheet to be reused.

### Choosing a Method

Inline CSS has the narrowest scope. Internal CSS is convenient for one page, while external CSS is generally preferred for larger websites because styles can be maintained and reused in one place.

### Connecting the Files

The href attribute specifies the location of an external stylesheet. The rel="stylesheet" attribute tells the browser that the linked resource is a stylesheet.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 2;

-- Level 3: Meet the Selectors
UPDATE lessons les
SET content_markdown = '## Concept

### What are Selectors?

Selectors tell CSS which HTML elements should receive a style. Choosing an appropriate selector is fundamental because it determines the scope of a rule.

### Element Selectors

An element selector targets every occurrence of an HTML element. For example, p { color: gray; } styles all paragraphs that match the selector.

### Class and ID Selectors

A class selector starts with a dot, such as .card, and can be reused on multiple elements. An ID selector starts with #, such as #header, and is intended to identify one unique element.

### Universal Selector

The universal selector * matches all elements. It is often used for broad rules such as setting box-sizing consistently.

### Selector Specificity

Different selectors have different specificity. In basic CSS, an ID selector is more specific than a class selector, which is more specific than an element selector; the universal selector has the lowest specificity.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 3;

-- Level 4: The Power of the Cascade and Specificity
UPDATE lessons les
SET content_markdown = '## Concept

### The Cascade

CSS allows multiple rules to target the same element. The cascade is the process used to determine which declarations apply when rules overlap or conflict.

### Order of Rules

When rules have the same importance and specificity and declare the same property, the later rule generally wins. For example, two identical p selectors setting different colors result in the color from the later declaration.

### Specificity

Specificity represents the relative strength of selectors. Inline styles generally outrank IDs, IDs outrank classes and attributes, and classes outrank element selectors.

### Conflicting and Non-Conflicting Properties

If two rules set different properties, both can apply. A conflict exists only when declarations affect the same property and compete under the cascade.

### Why Specificity Matters

Understanding specificity helps developers predict why a style is or is not being applied and avoids unnecessary use of overly strong selectors.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 4;

-- Level 5: Inheritance
UPDATE lessons les
SET content_markdown = '## Concept

### What is Inheritance?

Inheritance allows certain CSS properties set on a parent element to be passed to its descendants. Text-related properties such as color and font-family commonly inherit.

### Parent and Child Elements

If body has color: blue, descendant text may inherit that color unless a more specific rule or explicit value changes it. This reduces repeated declarations.

### Common Inherited Properties

Common inherited properties include color, font-family, font-size, font-weight, font-style, line-height, letter-spacing, word-spacing, and text-align.

### Properties That Usually Do Not Inherit

Properties such as margin, padding, border, width, height, background-color, display, and position generally do not inherit automatically.

### inherit, initial, and unset

inherit explicitly takes the parent''s computed value. initial resets a property to its initial value. unset behaves like inherit for inherited properties and like initial for non-inherited properties.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 5;

-- Level 6: Reusability in CSS
UPDATE lessons les
SET content_markdown = '## Concept

### What is Reusability?

Reusability means writing a style once and applying it to multiple elements. It reduces duplication and makes a stylesheet easier to maintain.

### Reusable Classes

Classes are the primary tool for reusable CSS. A .button class can style many buttons consistently without repeating the same declarations for each button.

### CSS Variables

Custom properties such as --primary-color can store reusable values. They are commonly defined on :root and referenced with var(--primary-color).

### Utility Classes

Small single-purpose classes such as .text-center or .bold can be combined across many elements. This approach is common in utility-oriented CSS systems.

### Why Reusability Matters

Reusable rules make design changes easier. Updating one shared declaration can update many components instead of requiring repeated edits.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 6;

-- Level 7: Attribute Selectors & Advanced Targeting
UPDATE lessons les
SET content_markdown = '## Concept

### What are Attribute Selectors?

Attribute selectors target elements based on the presence or value of an HTML attribute. For example, [href] matches elements that have an href attribute.

### Exact Value Matching

A selector such as input[type="text"] targets input elements whose type attribute exactly matches text.

### Contains, Starts With, and Ends With

CSS provides *= for values containing a substring, ^= for values beginning with a substring, and $= for values ending with a substring.

### Practical Targeting

Attribute selectors can distinguish form controls, links, images, and other elements without adding extra classes. Examples include input[type="password"], a[href^="https"], and img[src$=".png"].

### Combining Selectors

An element name can be combined with an attribute selector to make the target more precise, such as input[type="email"].

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 7;

-- Level 8: Interactive Styling with Pseudo-Classes
UPDATE lessons les
SET content_markdown = '## Concept

### What is a Pseudo-Class?

A pseudo-class targets an element based on a particular state or condition rather than simply its tag, class, or ID. It is written with a single colon.

### :hover

The :hover pseudo-class applies while the pointer is over an element. It is frequently used for buttons, links, cards, and navigation items.

### :focus and :active

:focus applies when an element has focus, which is especially important for form controls and keyboard navigation. :active represents an element while it is being activated, such as during a mouse click.

### :visited and Form States

:visited can style links the user has already visited. Other pseudo-classes such as :checked can target selected form controls.

### Why Interaction States Matter

State-based styling gives users visual feedback and improves usability without requiring changes to the HTML structure.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 8;

-- Level 9: Styling Parts of Elements with Pseudo-Elements
UPDATE lessons les
SET content_markdown = '## Concept

### What is a Pseudo-Element?

Pseudo-elements style a specific part of an element or create generated content. They use double-colon syntax such as ::before and ::first-letter.

### ::first-letter

The ::first-letter pseudo-element targets the first letter of text. It is often used for decorative typography such as drop-cap effects.

### ::first-line

::first-line styles the first line of text within an element. The exact portion considered the first line depends on the rendered layout.

### ::before and ::after

These pseudo-elements create generated boxes before or after an element''s content. They commonly use the content property and are useful for decorative icons, labels, or visual effects.

### Pseudo-Elements vs Pseudo-Classes

A pseudo-class describes a state such as :hover, while a pseudo-element targets a part of an element such as ::first-letter. Keeping this distinction clear helps with selector design.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 9;

-- Level 10: Understanding the CSS Box Model
UPDATE lessons les
SET content_markdown = '## Concept

### The Box Model

Every HTML element is treated as a rectangular box. The CSS box model describes four areas: content, padding, border, and margin.

### Content and Padding

Content is the innermost area containing text, images, or other information. Padding is space between the content and the border.

### Border and Margin

A border surrounds the padding and content. Margin creates space outside the border and separates the element from surrounding elements.

### box-sizing

With the default content-box model, declared width and height refer to the content area. With border-box, the declared width and height include the content, padding, and border.

### Spacing Shorthands

Padding and margin support shorthand notation. Four values are interpreted as top, right, bottom, left. Understanding these layers prevents unexpected sizing and spacing problems.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 10;

-- Level 11: Sizing & Overflow
UPDATE lessons les
SET content_markdown = '## Concept

### Width and Height

CSS provides width and height for controlling an element''s dimensions. These can use fixed units such as px or relative units such as %, rem, vw, and vh.

### Minimum and Maximum Sizes

min-width and min-height establish lower bounds, while max-width and max-height establish upper bounds. They are useful for responsive components that should not become too small or too large.

### Auto Sizing

The auto value allows the browser to determine a dimension based on layout rules and available content or space. This is useful when a component should adapt rather than use a fixed size.

### Overflow

Overflow controls what happens when content does not fit inside an element''s box. Common values include visible, hidden, scroll, and auto.

### Responsive Sizing

Combining max-width with relative sizing can prevent content from becoming excessively wide while still allowing it to shrink on smaller screens.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 11;

-- Level 12: Typography & Text Styling
UPDATE lessons les
SET content_markdown = '## Concept

### Font Families

font-family controls the typeface used for text. A font stack can provide fallbacks if the preferred font is unavailable.

### Font Size and Weight

font-size controls text size, while font-weight controls the thickness of characters. Relative units such as rem can make typography easier to scale consistently.

### Text Alignment and Decoration

text-align controls horizontal alignment of inline content within its containing block. text-decoration can add or remove underlines and other decorations.

### Line Height and Letter Spacing

line-height controls vertical spacing between lines of text. letter-spacing changes spacing between characters, while word-spacing changes spacing between words.

### Readable Typography

Good typography balances font size, line height, contrast, spacing, and width. CSS provides these properties so text can remain readable across different layouts.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 12;

-- Level 13: Colors, Backgrounds & Gradients
UPDATE lessons les
SET content_markdown = '## Concept

### CSS Colors

CSS supports named colors as well as hexadecimal, RGB/RGBA, HSL/HSLA, and other color representations. Color can be applied to text with color and to backgrounds with background-color.

### Backgrounds

background-color sets a solid background. Background images can be controlled with properties such as background-image, background-size, background-position, and background-repeat.

### Gradients

Gradients create smooth transitions between colors. Linear gradients change along a line, while radial gradients spread outward from a central point.

### Opacity and Transparency

RGBA and HSLA allow alpha transparency. The opacity property affects the transparency of an entire element, including its descendants, while an alpha color affects only the color itself.

### Layered Backgrounds

CSS can layer multiple backgrounds by providing multiple background images. This allows patterns, gradients, and images to be combined.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 13;

-- Level 14: Borders, Shadows & Visual Effects
UPDATE lessons les
SET content_markdown = '## Concept

### Borders

Borders surround an element''s padding and content. A border can be controlled through width, style, and color, or with the border shorthand.

### Border Radius

border-radius rounds corners. It can be applied uniformly or with different values for individual corners.

### Box Shadows

box-shadow adds shadows around an element. It can include horizontal and vertical offsets, blur, spread, and color.

### Text Shadows

text-shadow applies a shadow to text and can be used for subtle emphasis or visual effects.

### Outline and Visual Polish

outline is drawn outside the border and does not normally take up layout space. Borders, shadows, radius, and outlines can improve visual hierarchy when used carefully.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 14;

-- Level 15: Display & Positioning
UPDATE lessons les
SET content_markdown = '## Concept

### The display Property

display controls how an element participates in layout. Common values include block, inline, inline-block, none, flex, and grid.

### Block and Inline

Block elements generally begin on a new line and can take available width. Inline elements flow within text and generally do not accept width and height in the same way block-level boxes do.

### Positioning

The position property supports static, relative, absolute, fixed, and sticky positioning. The chosen mode determines how offsets such as top, right, bottom, and left are interpreted.

### Positioned Elements

A relatively positioned element stays in normal flow while allowing offsets. An absolutely positioned element is removed from normal flow and is positioned relative to an appropriate containing block.

### Fixed and Sticky Positioning

fixed positioning attaches an element to the viewport, while sticky positioning behaves like relative positioning until a scroll threshold is reached and then sticks within its containing area.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 15;

-- Level 16: Flexbox Fundamentals
UPDATE lessons les
SET content_markdown = '## Concept

### What is Flexbox?

Flexbox is a one-dimensional layout system designed to arrange items in a row or column. A flex container controls the alignment and distribution of its direct children.

### Main and Cross Axes

The main axis follows flex-direction. With the default row direction, the main axis is horizontal and the cross axis is vertical.

### Flex Direction

flex-direction can be row, row-reverse, column, or column-reverse. It determines the direction in which flex items are placed.

### Alignment and Distribution

justify-content distributes items along the main axis, while align-items aligns them along the cross axis. gap provides spacing between flex items.

### Flex Item Sizing

flex-grow, flex-shrink, and flex-basis influence how flex items use available space. flex-wrap allows items to move onto additional lines when necessary.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 16;

-- Level 17: Advanced Flexbox Layouts
UPDATE lessons les
SET content_markdown = '## Concept

### Flex Item Growth

flex-grow controls how an item can receive extra free space. Items with larger growth factors receive a larger share of available space.

### Flex Shrinking

flex-shrink controls how items reduce their size when the container does not have enough space. It works with the flex basis and available free space.

### Flex Basis

flex-basis defines the initial main-size contribution of a flex item before remaining space is distributed.

### Alignment and Wrapping

align-content affects the distribution of multiple flex lines when wrapping occurs, while align-items affects the items within a line.

### Common Layout Patterns

Flexbox is useful for navigation bars, toolbars, card rows, centered content, and components where items need flexible sizing and alignment.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 17;

-- Level 18: CSS Grid Layout
UPDATE lessons les
SET content_markdown = '## Concept

### What is CSS Grid?

CSS Grid is a two-dimensional layout system that works with rows and columns. It is useful when both horizontal and vertical relationships matter.

### Grid Container and Items

Applying display:grid to an element creates a grid container. Its direct children become grid items.

### Rows, Columns, and Tracks

Grid tracks are rows or columns. grid-template-columns and grid-template-rows define track sizes. The fr unit represents a fraction of available grid space.

### Gaps and Placement

gap controls spacing between grid tracks. Grid items can be positioned with grid-column and grid-row, and named areas can be created with grid-template-areas.

### Responsive Grid Patterns

Functions such as repeat(), minmax(), and auto-fit can create flexible grids that adapt to available space.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 18;

-- Level 19: Responsive Design & Media Queries
UPDATE lessons les
SET content_markdown = '## Concept

### Responsive Design

Responsive design makes layouts adapt to phones, tablets, laptops, and large displays. It combines flexible sizing, layout systems, and conditional CSS.

### Media Queries

Media queries use the @media at-rule to apply styles when specified conditions are true, such as viewport width, height, or orientation.

### Breakpoints

A breakpoint is a condition or screen range where the layout changes. Breakpoints should be chosen according to when the design needs to adapt rather than relying on device names alone.

### Viewport Units and Relative Units

vw is based on viewport width and vh on viewport height. rem is based on the root element''s font size, making it useful for scalable typography.

### Mobile-First Design

A mobile-first approach starts with a simple layout for smaller screens and progressively adds or changes styles for larger screens using media queries.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 19;

-- Level 20: Modern CSS – Variables, Animations, Transforms & Advanced Features
UPDATE lessons les
SET content_markdown = '## Concept

### CSS Variables and Calculation

Custom properties make design values reusable. var() retrieves them, while calc() can combine values. min(), max(), and clamp() help create flexible dimensions and typography.

### Transforms and Transitions

transform can translate, scale, rotate, or skew an element without changing normal document flow. transition creates smooth changes between property values.

### CSS Animations

@keyframes defines stages of an animation, while animation properties control duration, timing, delay, iteration count, direction, and fill behavior.

### Container Queries and Nesting

Container queries allow components to respond to the size of their containing context rather than only the viewport. CSS nesting lets related rules be written in a nested form, improving organization in supported environments.

### Cascade Layers and Modern Architecture

@layer provides an explicit way to organize groups of styles in the cascade. Together with variables, reusable components, and clear naming, modern CSS features support scalable stylesheets.

## Questions',
    updated_at = now()
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE les.level_id = l.id
  AND s.code = 'CSS'
  AND l.level_number = 20;

