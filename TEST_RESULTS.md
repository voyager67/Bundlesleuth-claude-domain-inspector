# Test Results Report

**Project:** Claude Bundle Domain Inspector  
**Report date:** 2026-10-15  
**Test type:** Local automated tests using a temporary simulated Claude Code bundle  
**Environment note:** These tests were run in a non-macOS environment. They do not constitute validation against an actual macOS Claude Code installation.

## Results

| Test | Result | Evidence |
|---|---|---|
| Shell syntax validation | PASS | `sh -n claude-bundle-gov-domain-inspector.sh` completed without errors. |
| Domain detection | PASS | Detected `alpha.ic.gov` and `service.sgov.gov` in a temporary test file. |
| Duplicate handling | PASS | Repeated `alpha.ic.gov` appeared once in the output. |
| Unrelated domains | PASS | `example.com` was not reported. |
| Missing installation | PASS | With no matching bundle present, the script displayed the expected “No bundled Claude Code binary found” message. |

## Test method

The script was run with a temporary home directory containing a fixture at the path pattern it searches. A second empty temporary home directory was used to check the missing-installation path. Temporary test files were removed after the checks.

## Limitations

- The bundle was simulated; this test did **not** use an actual macOS Claude Code installation.
- The checks validate the script's current string-matching behavior, not whether any domain is contacted or used at runtime.
- Results can differ with different application versions, installation paths, permissions, or binary contents.

## Reproduce

From the project directory:

```sh
sh -n claude-bundle-gov-domain-inspector.sh
./claude-bundle-gov-domain-inspector.sh
```

The second command inspects the expected local path on the machine where it is run. This report's automated fixture checks used temporary files and are not performed by the script itself.
