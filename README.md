# Deskland — Forest Prototype (cloud build)

This is a small SwiftUI prototype for Apple Silicon Macs. It is intended to be built by GitHub Actions on a hosted macOS runner, so Xcode does not need to be installed on the user's Mac.

## What this prototype does
- Draws a stylized aerial forest canopy, a clearing, and a winding stream.
- Creates a borderless, transparent, non-interactive desktop-level window.
- Targets macOS 13+ and Apple Silicon (`arm64`).

## Important limitations
- This is an early prototype, not a finished Deskland replacement.
- Finder icon positions are not read, and the landscape does not yet adapt around files or folders.
- Desktop window layering can vary by macOS version and must be tested on the target Mac.
- The app is unsigned and not notarized. macOS may show a security warning when opening it.

## Build
The workflow in `.github/workflows/build.yml` runs on GitHub's hosted macOS runner. It builds an arm64 executable, packages it as `Deskland.app`, and uploads `Deskland-macOS-arm64.zip` as a workflow artifact.
