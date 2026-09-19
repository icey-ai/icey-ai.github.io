// Native Typst helpers used by the one-time MiTeX 0.2.7 migration.
// No LaTeX parser or WASM runs when the blog is built.
#import "../packages/mitex-compat/specs/mod.typ": mitex-scope

#let negthinspace = mitex-scope.at("negthinspace")
// Symbols retain their operator class in MathML; the upstream string "||"
// becomes mtext and loses the delimiter semantics on HTML export.
#let lVert = math.class("opening", sym.bar.v.double)
#let rVert = math.class("closing", sym.bar.v.double)
#let mitexinline = mitex-scope.at("mitexinline")
#let mitexmathbf = mitex-scope.at("mitexmathbf")
#let big = mitex-scope.at("big")
#let Big = mitex-scope.at("Big")
#let frac = mitex-scope.at("frac")
#let tfrac = mitex-scope.at("tfrac")
#let mitexunderbrace = mitex-scope.at("mitexunderbrace")
// AMS \boxed uses display style even when called from inline math. Avoid
// nesting an inline equation, which resets large operators on HTML export.
#let boxed(body) = context if target() == "html" {
  html.elem("mrow", attrs: (class: "math-boxed", displaystyle: "true"), math.display(body))
} else {
  box(stroke: 0.5pt, inset: 6pt, $display(body)$)
}
#let pmatrix = mitex-scope.at("pmatrix")
// The surrounding equation already owns the alignment points. Wrapping the
// body in math.op (as upstream does for PDF) flattens its MathML structure.
#let aligned(body) = body
#let operatorname = mitex-scope.at("operatorname")
#let textmath = mitex-scope.at("textmath")
#let mitexsqrt = mitex-scope.at("mitexsqrt")
