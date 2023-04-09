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
  font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-feature-settings: normal;
  font-variation-settings: normal;

  --theme-color: ◊|theme-color|;
}

body, h1, h2, h3, h4, h5, h6, p, ol, ul {
  margin: 0;
  padding: 0;
  font-weight: normal;
  overflow-wrap: break-word;
}

ol, ul {
  list-style: none;
}

img, picture, video, canvas, svg {
  display: block;
  max-width: 100%;
}

body {
  background-color: var(--theme-color);
  color: white;
}
