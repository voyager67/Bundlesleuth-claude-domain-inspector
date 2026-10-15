# Technical Notes

## How it works

1. The shell script starts Python 3.
2. Python searches the expected macOS Claude Code bundle directory for files matching `*/*/claude.app/Contents/MacOS/claude`.
3. Each matching file is read as bytes.
4. A byte-level regular expression finds strings shaped like one or more DNS labels followed by `.ic.gov` or `.sgov.gov`.
5. Matches are deduplicated, sorted, and printed.

## Detection pattern

```regex
(?:[a-z0-9-]+\.)+(?:ic\.gov|sgov\.gov)
```

This is a simple string-matching heuristic, not a DNS validator or network monitor. It may miss uppercase variants, other suffixes, strings assembled at runtime, or values stored outside the searched binary.

## Exit behavior

- `0` when no matching bundle file is found (with an explanatory message), or after scanning files.
- A shell/Python startup error may produce a non-zero exit status if required tooling is unavailable.
- Individual file read failures are reported and scanning continues.
