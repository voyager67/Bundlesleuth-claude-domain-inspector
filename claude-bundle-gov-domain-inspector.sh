#!/bin/sh
# Claude Bundle Domain Inspector
# Inspect local Claude Code bundle binaries for selected .gov domain strings.
# macOS + Python 3. Reads local files only; does not run Claude or make network requests.
set -eu

if [ "$(uname -s)" != "Darwin" ]; then
    printf '%s\n' "Note: this utility is designed for macOS. Continuing anyway." >&2
fi

python3 - <<'PY'
from pathlib import Path
import re
import sys

root = Path.home() / "Library/Application Support/Claude/claude-code"
pattern = re.compile(rb"(?:[a-z0-9-]+\.)+(?:ic\.gov|sgov\.gov)")
files = sorted(root.glob("*/*/claude.app/Contents/MacOS/claude"))

if not files:
    print("No bundled Claude Code binary found at the expected location:")
    print(f"  {root}")
    print("Check whether Claude Code is installed in this location.")
    sys.exit(0)

for file_path in files:
    print(f"\n== {file_path} ==")
    try:
        matches = sorted({match.decode("ascii") for match in pattern.findall(file_path.read_bytes())})
    except OSError as exc:
        print(f"Could not read file: {exc}", file=sys.stderr)
        continue

    if matches:
        print("\n".join(matches))
        print(f"\nFound {len(matches)} unique matching string(s).")
    else:
        print("No matching strings found.")
PY
