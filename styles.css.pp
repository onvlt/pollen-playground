#lang pollen

*,
::before,
::after {
  box-sizing: border-box;
  border-width: 0;
  border-style: solid;
  border-color: currentColor;
}

html {
  line-height: 1.5;
  font-family: "IBM Plex Serif", ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-feature-settings: normal;
  font-variation-settings: normal;

  --theme-color: ◊|theme-color|;
}

body, h1, h2, h3, h4, h5, h6, p, ol, ul, li {
  margin: 0;
  padding: 0;
  margin-bottom: 1em;
  font-size: inherit;
  font-weight: normal;
  overflow-wrap: break-word;
}

h1 {
  font-size: 3rem;
  font-weight: 600;
  line-height: 1.25;
}

h2 {
  font-size: 2rem;
  font-weight: 600;
  line-height: 1.35;
}

h3 {
  font-size: 1.5rem;
  font-weight: 600;
  line-height: 1.45;
}

:is(h1, h2, h3, h3, h5, h6):not(:first-child) {
  margin-top: 2em;
}

ol {
  padding-left: 1.5rem;
}

li {
  padding-left: 0.5rem;
}

img, picture, video, canvas, svg {
  display: block;
  max-width: 100%;
}

body {
  font-size: 1.25rem;
}

.container {
  margin: 0 auto;
  padding: 6rem 2rem;
  max-width: 1024px;
}
