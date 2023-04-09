# Pollen project template

This is template repostitory for project in [Pollen](https://docs.racket-lang.org/pollen/) – programmable publishing system written in [Racket](https://racket-lang.org/). It allows you to publish single input in many target formats, including HTML, Latex, PDF, epub, whatever you have. You achieve this by writing input in your own DSL and then you program how it should be translated to particular medium. Take footnotes as example – in PDF you might want to gather them and then render them all at once at the end of the document. In HTML, you might want to render them as sidenotes. You can even create many types of whatever-notes. Source format doesn't care – you just write and tag it semantically as you go.

Think of it like better [Pandoc](https://pandoc.org/). However, unlike Pandoc, Pollen doesn't restrict you to the lowest common denominator of all media, but it allows you to take advantage of peculiarities of particular medium.

This particular project sets up HTML and [ConTeXt](https://wiki.contextgarden.net/) targets.

## Requirements

- [Racket](https://racket-lang.org/)
- [Pollen](https://docs.racket-lang.org/pollen/)
- [ConTeXt](https://wiki.contextgarden.net/)
