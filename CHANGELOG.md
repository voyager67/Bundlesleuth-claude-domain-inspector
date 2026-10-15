# Changelog

## Unreleased

- Renamed the script to `claude-bundle-gov-domain-inspector.sh`.
- Added clearer handling for missing bundle files and unreadable files.
- Added project documentation for setup, usage, scope, and limitations.
- Kept inspection local-only; the script does not make network requests.


## 1.1.0

- Added an MIT `LICENSE` file with copyright attribution to Harsh Singh.
- Updated the README with the author/maintainer section and license details.


### Test report update
- Added `TEST_RESULTS.md` with the test method, five passing checks, and environment limitations.
- Added `reports/test-results.html`, a standalone browser-friendly report.
- Linked the report from the README.
- Confirmed the checks using a temporary simulated bundle; no actual macOS Claude Code installation was available for testing.
