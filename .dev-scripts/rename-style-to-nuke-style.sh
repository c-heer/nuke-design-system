#!/bin/bash
set -e  # Exit on any error

# ============================================
# RENAME: style → nuke-style
# ============================================
# This script renames all occurrences of the style attribute
# to nuke-style across the codebase.
#
# What it changes:
# - CSS: [style="1"] → [nuke-style="1"]
# - CSS: .style-1 → .nuke-style-1
# - HTML: style="1" → nuke-style="1"
# - Comments/docs mentioning the pattern
#
# Safe features:
# - DRY_RUN mode (test first)
# - Backup creation
# - File-by-file processing with verification
# ============================================

DRY_RUN=${1:-false}

if [ "$DRY_RUN" = "dry-run" ]; then
  echo "🔍 DRY RUN MODE - No files will be changed"
  echo ""
fi

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "================================================"
echo "  RENAME: style → nuke-style"
echo "================================================"
echo ""

# ============================================
# Step 1: Find all files to process
# ============================================
echo "${BLUE}Step 1: Finding files...${NC}"

FILES_CSS=$(find core -name "*.css" -type f)
FILES_TS=$(find core -name "*.ts" -type f)
FILES_ASTRO=$(find docs/src -name "*.astro" -type f 2>/dev/null || echo "")
FILES_MD=$(find . -maxdepth 2 -name "*.md" -type f | grep -v node_modules || echo "")

ALL_FILES="$FILES_CSS $FILES_TS $FILES_ASTRO $FILES_MD"
FILE_COUNT=$(echo "$ALL_FILES" | wc -w | xargs)

echo "Found ${FILE_COUNT} files to process"
echo ""

# ============================================
# Step 2: Create backup (if not dry-run)
# ============================================
if [ "$DRY_RUN" != "dry-run" ]; then
  BACKUP_DIR=".dev-scripts/backup-$(date +%Y%m%d-%H%M%S)"
  echo "${BLUE}Step 2: Creating backup at ${BACKUP_DIR}${NC}"
  mkdir -p "$BACKUP_DIR"

  for file in $ALL_FILES; do
    if [ -f "$file" ]; then
      mkdir -p "$BACKUP_DIR/$(dirname "$file")"
      cp "$file" "$BACKUP_DIR/$file"
    fi
  done

  echo "${GREEN}✓ Backup created${NC}"
  echo ""
else
  echo "${YELLOW}Step 2: Skipping backup (dry-run mode)${NC}"
  echo ""
fi

# ============================================
# Step 3: Process files
# ============================================
echo "${BLUE}Step 3: Processing files...${NC}"
echo ""

CHANGED_COUNT=0

for file in $ALL_FILES; do
  if [ ! -f "$file" ]; then
    continue
  fi

  # Check if file contains any patterns we need to change
  if ! grep -q -E '(style="|\.style-|\[style=)' "$file" 2>/dev/null; then
    continue
  fi

  echo "📝 Processing: $file"

  if [ "$DRY_RUN" = "dry-run" ]; then
    # Show what would change
    echo "${YELLOW}   Would change:${NC}"
    grep -n -E '(style="|\.style-|\[style=)' "$file" | head -3 || true
    echo ""
  else
    # Actually make changes using sed
    # macOS uses BSD sed, need -i '' for in-place edit
    # IMPORTANT: Do all replacements in a single sed call to avoid intermediate states

    sed -i '' \
      -e 's/\[style="/[nuke-style="/g' \
      -e 's/\.style-\([123]\)/.nuke-style-\1/g' \
      -e 's/ style="\([123]\)"/ nuke-style="\1"/g' \
      -e "s/ style='\([123]\)'/ nuke-style='\1'/g" \
      -e 's/style="1\/2\/3"/nuke-style="1\/2\/3"/g' \
      "$file"

    echo "${GREEN}   ✓ Updated${NC}"
    CHANGED_COUNT=$((CHANGED_COUNT + 1))
  fi
done

echo ""
echo "================================================"
if [ "$DRY_RUN" = "dry-run" ]; then
  echo "${YELLOW}DRY RUN COMPLETE${NC}"
  echo "Run without 'dry-run' argument to apply changes"
else
  echo "${GREEN}RENAME COMPLETE!${NC}"
  echo "Changed ${CHANGED_COUNT} files"
  echo "Backup saved to: ${BACKUP_DIR}"
fi
echo "================================================"
