// Tylant frontmatter contract, using Typst 0.15's native HTML and MathML export.
// Website typography is controlled by src/styles/blog.css; PDF styles live here.
#let main(
  title: "Untitled", desc: "", date: "1970-01-01", tags: (), categories: (),
  author: "Icey AI", lang: "zh", permalink: none, draft: false,
  cover: none, updated-date: none,
  show-outline: true, body,
) = {
  set document(title: title, author: author)
  set text(lang: lang)
  [#metadata((
    title: title, description: desc, date: date, tags: tags, categories: categories,
    author: author, lang: lang, draft: draft,
    ..if permalink != none { (permalink: permalink) },
    ..if cover != none { (image: cover) },
    ..if updated-date != none { (updatedDate: updated-date) },
  )) <frontmatter>]
  context if target() == "html" {
    show math.equation.where(block: true): it => html.elem("div", attrs: (class: "equation-block"), it)
    show heading: it => if it.has("label") {
      html.elem("h" + str(calc.min(it.level + 1, 6)), attrs: (id: str(it.label)), it.body)
    } else { it }
    // Public assets remain cacheable files rather than multi-megabyte data URLs.
    show image: it => if type(it.source) == str and it.source.starts-with("/public/") {
      html.elem("img", attrs: (src: it.source.slice(7), alt: it.alt, loading: "lazy"))
    } else { it }
    // Native headings, links, footnotes, code and equations retain their semantics.
    if show-outline and query(heading).len() > 0 {
      html.elem("details", attrs: (class: "outline", open: ""), {
        html.elem("summary", if lang == "zh" { "目录" } else { "Contents" })
        outline(title: none, depth: 3)
      })
    }
    body
  } else {
    set page(paper: "a4", margin: 24mm, numbering: "1")
    set text(font: "New Computer Modern", size: 10.5pt)
    set par(justify: true)
    align(center, [#text(20pt, weight: "bold", title) #linebreak() #date · #author])
    v(1em)
    if show-outline { outline(depth: 3) }
    body
  }
}
#let main-en = main.with(lang: "en")
#let main-zh = main.with(lang: "zh")
