"""Build the small STIX-derived font used for MathML accent compatibility.

Run only when updating the vendored font, not during normal site builds:
  python -m pip install 'fonttools[woff]'
  python scripts/build-math-accents.py /path/to/STIXTwoMath-Regular.ttf

Blink misplaces standalone combining accents. MathML Core B.3 permits the
spacing equivalents, but STIX attaches its stretchy variants only to the
combining characters. Copy those variant lists to the spacing characters.
Glyph outlines are unchanged; no formula-specific dimensions are involved.
"""
from copy import deepcopy
from hashlib import sha256
from pathlib import Path
import sys
from fontTools import subset
from fontTools.ttLib import TTFont

SOURCE_SHA256 = '562551b15b836e6e01d1b7350909baf3c8c8d83260c1190fbf4544333e6936de'
source = Path(sys.argv[1])
assert sha256(source.read_bytes()).hexdigest() == SOURCE_SHA256, 'Unexpected source font version'
font = TTFont(source, recalcTimestamp=False)
cmap = font.getBestCmap()
variants = font['MATH'].table.MathVariants
records = dict(zip(variants.HorizGlyphCoverage.glyphs, variants.HorizGlyphConstruction))
for combining, spacing in [(0x0302, 0x02C6), (0x0303, 0x02DC)]:
    src, dst = cmap[combining], cmap[spacing]
    construction = deepcopy(records[src])
    for record in construction.MathGlyphVariantRecord:
        if record.VariantGlyph == src:
            record.VariantGlyph = dst
            record.AdvanceMeasurement = font['hmtx'].metrics[dst][0]
    records[dst] = construction
glyphs = sorted(records, key=font.getGlyphID)
variants.HorizGlyphCoverage.glyphs = glyphs
variants.HorizGlyphConstruction = [records[glyph] for glyph in glyphs]
variants.HorizGlyphCount = len(glyphs)

options = subset.Options()
options.name_IDs = ['*']
options.name_legacy = True
options.name_languages = ['*']
options.recalc_timestamp = False
subsetter = subset.Subsetter(options=options)
subsetter.populate(unicodes=[0x02C6, 0x02DC])
subsetter.subset(font)
# Respect the source font's Reserved Font Name. Keep copyright and OFL data.
names = {
    1: 'Blog Math Accents', 2: 'Regular', 3: 'BlogMathAccents-Regular-1.0',
    4: 'Blog Math Accents Regular', 6: 'BlogMathAccents-Regular',
    16: 'Blog Math Accents', 17: 'Regular',
    10: 'STIX Two Math 2.12 accent glyphs with MathML spacing-character variants.',
}
for record in font['name'].names:
    if record.nameID in names:
        record.string = names[record.nameID].encode(record.getEncoding())
font.flavor = 'woff2'
output = Path(__file__).resolve().parents[1] / 'public/assets/fonts/BlogMathAccents.woff2'
font.save(output)
print(f'{output.name}: {output.stat().st_size} bytes; SHA-256 {sha256(output.read_bytes()).hexdigest()}')
