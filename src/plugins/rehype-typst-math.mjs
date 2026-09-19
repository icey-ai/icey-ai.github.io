// MathML Core B.3 gives spacing equivalents for these combining accents:
// https://www.w3.org/TR/mathml-core/#combining-character-equivalences
// Blink miscenters the combining glyph when the base is narrow. The small
// companion font preserves STIX's stretchy variants for the spacing glyphs.
const spacingAccents = new Map([["\u0302", "\u02c6"], ["\u0303", "\u02dc"]]);

export default function rehypeTypstMath() {
  return function transform(tree) {
    function visit(node) {
      if (node.type === "element" && node.tagName === "mover"
        && [true, "true"].includes(node.properties?.accent)) {
        const elements = node.children.filter(child => child.type === "element");
        const accent = elements[1];
        if (elements.length === 2 && accent?.tagName === "mo"
          && accent.children.length === 1 && accent.children[0].type === "text") {
          const replacement = spacingAccents.get(accent.children[0].value);
          if (replacement) {
            accent.children[0].value = replacement;
            accent.properties ??= {};
            accent.properties.stretchy ??= "true";
            const classes = accent.properties.className ?? [];
            accent.properties.className = [...(Array.isArray(classes) ? classes : classes.split(/\s+/)), "math-spacing-accent"];
          }
        }
      }
      for (const child of node.children ?? []) visit(child);
    }
    visit(tree);
  };
}
