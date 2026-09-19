import assert from 'node:assert/strict';
import { test } from 'node:test';
import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler';
import rehypeTypstMath from '../src/plugins/rehype-typst-math.mjs';

const compiler = NodeCompiler.create({ workspace: process.cwd() });
const flatten = node => [node, ...(node.children ?? []).flatMap(flatten)];
const elements = (node, tag) => flatten(node).filter(x => x.type === 'element' && x.tagName === tag);
const text = node => flatten(node).filter(x => x.type === 'text').map(x => x.value).join('');
const hasClass = (node, name) => (node.properties?.className ?? node.properties?.class ?? '').includes(name);

function compile(options) {
  const result = compiler.tryHtml(options);
  if (result.hasError()) result.printDiagnostics();
  assert.equal(result.hasError(), false, 'The real Typst compiler must accept the fixture');
  return result.result.hast();
}

test('original notation remains inline and keeps its manual line breaks', () => {
  const tree = compile({ mainFilePath: 'content/article/calculus-on-manifold.typ' });
  const note = elements(tree, 'aside').find(x => text(x).includes('for omitting this item'));
  assert(note);
  const math = elements(note, 'math');
  assert.equal(math.length, 8);
  assert(math.every(x => x.properties.display !== 'block'));
  assert.equal(elements(note, 'br').length, 6);
  assert.equal(elements(tree, 'math').filter(x => x.properties.display === 'block').length, 255);
  assert(elements(note, 'p').some(x => hasClass(x, 'callout-title')));
});

test('boxed expressions retain display-sized operators and sum limits', () => {
  const tree = compile({ mainFileContent: `
    #import "/typ/templates/legacy-math.typ": boxed
    Inline: $boxed(sum_(i=1)^n i = integral_0^1 x dif x)$.
    $ boxed(sum_(i=1)^n i = integral_0^1 x dif x) $
  ` });
  const boxes = elements(tree, 'mrow').filter(x => hasClass(x, 'math-boxed'));
  assert.equal(boxes.length, 2);
  for (const box of boxes) {
    assert.equal(box.properties.displaystyle, 'true');
    assert.equal(elements(box, 'math').length, 0, 'Nested inline math resets display style');
    assert.equal(elements(box, 'munderover').length, 1, 'Display sums need limits above and below');
    assert.equal(elements(box, 'msubsup').length, 1, 'Integral limits remain at the side');
  }
});

test('accent compatibility preserves bases, subscripts, and wide accents', () => {
  const tree = compile({ mainFileContent: '$hat(dot.c)$ $hat(x y)$ $tilde(x)$ $x_(hat(y))$' });
  const bases = elements(tree, 'mover').map(x => JSON.stringify(x.children[0]));
  rehypeTypstMath()(tree);
  const accents = elements(tree, 'mover');
  assert.equal(accents.length, 4);
  assert.deepEqual(accents.map(x => JSON.stringify(x.children[0])), bases);
  assert.deepEqual(accents.map(x => text(x.children[1])), ['\u02c6', '\u02c6', '\u02dc', '\u02c6']);
  assert(accents.every(x => x.children[1].properties.stretchy === 'true'));
  assert(accents.every(x => hasClass(x.children[1], 'math-spacing-accent')));
  const once = JSON.stringify(tree);
  rehypeTypstMath()(tree);
  assert.equal(JSON.stringify(tree), once, 'The export transform must be idempotent');
});
