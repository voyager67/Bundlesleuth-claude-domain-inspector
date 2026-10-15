# Claude Bundle Domain Inspector

<p align="center">
  <strong>A small, local-first macOS utility for inspecting selected domain strings in Claude Code bundle files.</strong>
</p>

<p align="center">
  <code>Shell</code> · <code>Python 3</code> · <code>macOS</code> · <code>Local inspection</code>
</p>

---

## What it does

**Claude Bundle Domain Inspector** searches locally installed Claude Code bundle binaries for strings matching a narrow pattern of `.gov` subdomains, specifically domains ending in `ic.gov` or `sgov.gov`.

It is a lightweight inspection script intended for learning, debugging, and reproducible local checks. It does **not** determine why a string is present, whether it is active, or whether any network request was made.

## Highlights

- **Local-only inspection:** reads files from your Mac; makes no network requests.
- **No execution of the inspected binary:** it reads bytes from matching files.
- **Unique results:** duplicate matches are collapsed and sorted.
- **Readable output:** shows the file path and matching strings.
- **Small footprint:** a shell launcher with an embedded Python 3 script.

## Requirements

- macOS (the default search path is macOS-specific)
- Python 3 available as `python3`
- Claude Code bundle files present in the expected location

The script looks under:

```text
~/Library/Application Support/Claude/claude-code/
```

It searches for files matching this layout:

```text
*/*/claude.app/Contents/MacOS/claude
```

If your installation uses a different location or layout, the script may report that it found no matching binary.

## Run it

1. Download or clone this repository.
2. Open Terminal and move into the project directory.
3. Make the script executable if needed:

   ```bash
   chmod +x claude-bundle-gov-domain-inspector.sh
   ```

4. Run it:

   ```bash
   ./claude-bundle-gov-domain-inspector.sh
   ```

The script prints matching strings it finds, or a message when no matching file or string is found.

## Example output

Illustrative output only — your results will depend on the files on your machine.

```text
== /Users/example/Library/Application Support/Claude/claude-code/.../claude ==
example.ic.gov
service.sgov.gov

Found 2 unique matching string(s).
```

## Scope and limitations

- It searches for **literal byte strings** matching the pattern; it is not a full domain inventory.
- The pattern is deliberately narrow: it looks for host-like strings ending in `ic.gov` or `sgov.gov`.
- A match does not prove that the domain is contacted, configured, trusted, or used at runtime.
- No match does not prove that no related domain exists; strings may be encoded, constructed dynamically, or stored elsewhere.
- The default path is specific to one expected macOS bundle layout.
- The script does not modify files, inspect network traffic, or launch Claude Code.

## Safety and privacy

This utility reads local files and prints file paths and matching strings to your terminal. It does not intentionally transmit data. Review the source before running any script, especially when using it on a machine containing sensitive information.

Avoid posting raw output publicly without checking it for usernames, private paths, or other information you do not want to disclose.

## Project structure

```text
claude-bundle-domain-inspector/
├── claude-bundle-gov-domain-inspector.sh
├── README.md
├── LICENSE
├── CHANGELOG.md
├── SECURITY.md
├── .gitignore
└── docs/
    └── TECHNICAL_NOTES.md
```

## Contributing

Bug reports and small, focused improvements are welcome. Please describe your macOS version, Python version, expected behavior, and the relevant error message. Remove private paths or sensitive data from logs before sharing.

See [SECURITY.md](SECURITY.md) for responsible reporting guidance.

## Author

**Harsh Singh** — creator and maintainer of this project.

## License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for the full terms. The license permits use, modification, and redistribution, provided the copyright and permission notice are included.

---

*Built as a compact developer utility: inspect, understand, and verify locally.*


## Test report

See [`TEST_RESULTS.md`](TEST_RESULTS.md) for the detailed automated test results and limitations, or open the standalone [HTML report](reports/test-results.html). The checks used a simulated bundle; they have not been run against an actual macOS Claude Code installation.
