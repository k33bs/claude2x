#!/bin/bash
# Build & deploy claude2x to Cloudflare Pages
# Minifies aggressively and optionally deploys

set -e

DIST="dist"
PROJECT="claude2x"

rm -rf "$DIST"
mkdir -p "$DIST"

cp src/index.html "$DIST/index.html"

# Aggressive minification
npx --yes html-minifier-terser \
  --collapse-whitespace \
  --collapse-boolean-attributes \
  --remove-comments \
  --remove-optional-tags \
  --remove-redundant-attributes \
  --remove-empty-attributes \
  --remove-attribute-quotes \
  --sort-attributes \
  --sort-class-name \
  --decode-entities \
  --minify-css '{"level":2}' \
  --minify-js '{"compress":{"passes":3,"drop_console":true,"pure_funcs":["console.log"]},"mangle":true}' \
  "$DIST/index.html" -o "$DIST/index.html"

ORIG=$(wc -c < src/index.html | tr -d ' ')
MIN=$(wc -c < "$DIST/index.html" | tr -d ' ')
RATIO=$((100 - MIN * 100 / ORIG))
echo "Built to $DIST/ (${ORIG} → ${MIN} bytes, ${RATIO}% smaller)"

# Deploy if --deploy flag passed
if [[ "$1" == "--deploy" ]]; then
  wrangler pages deploy "$DIST" --project-name "$PROJECT" --commit-dirty=true
else
  echo "Run with --deploy to push to Cloudflare Pages"
fi
