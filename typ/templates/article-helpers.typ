// Shared components work in both HTML and PDF exports.
#let details(summary, body, open: false) = context if target() == "html" {
  html.elem("details", attrs: (class: "proof", ..if open { (open: "") }), {
    html.elem("summary", summary)
    body
  })
} else {
  strong(summary)
  parbreak()
  body
  parbreak()
}

// Collapsible on the website; always expanded in PDF/editor previews.
#let proof(body, title: "证明", open: false) = details(title, body, open: open)

#let callout(kind, body) = context if target() == "html" {
  html.elem("aside", attrs: (class: "callout callout-" + kind, role: "note"), {
    html.elem("p", attrs: (class: "callout-title"), strong(upper(kind)))
    body
  })
} else {
  block(width: 100%, inset: 8pt, fill: luma(245), stroke: luma(210), {
    strong(upper(kind))
    parbreak()
    body
  })
}
