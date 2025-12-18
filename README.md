# Ruby Primer

Ruby Primer is a set of interactive lessons that run in a text console. It was originally based on the excellent primer maintained by C42 Engineering at RubyMonk.com, but that site was taken down earlier this year. The lessons have been preserved and enhanced here.

## Technology Used

- **Language**: Ruby 3.2+
- **Dependencies**: Bundler for gem management, RSpec for testing, Ruby-Figlet for ASCII art, Colorize for colored output
- **Image Generation**: Pandoc and XeLaTeX for PDF creation from Markdown, ImageMagick for PNG conversion
- **Terminal Image Display**: viu for inline images in Kitty, built-in support for iTerm2
- **Build Tools**: GitHub Actions for CI (Ruby and JSON syntax checks)

## Supported Terminals

- **iTerm2** on macOS (displays formatted text as PDF images)
- **Kitty** on macOS or Linux (displays formatted text as PNG images via viu)

## Prerequisites

- Ruby 3.2 or higher
- Bundler
- Pandoc
- XeLaTeX (with IBM Plex Serif Light font)
- ImageMagick
- viu (for Kitty support)
- Terminal with at least 135 columns x 40 rows

## Getting Started

1. Run `./install.sh` to install dependencies and set up the environment.
2. Run `./rp` to start the interactive Ruby lessons.
3. Follow the on-screen instructions to navigate lessons and run examples/tests.
