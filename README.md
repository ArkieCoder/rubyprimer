# Ruby Primer

Ruby Primer is a set of interactive lessons that run in a text console. It was originally based on the excellent primer maintained by C42 Engineering at RubyMonk.com, but that site was taken down in 2025. The lessons have been preserved here.

## Technology Used

- **Language**: Ruby 3.2+
- **Dependencies**: 
  - Bundler for gem management
  - RSpec for testing
  - Ruby-Figlet for ASCII art
  - Colorize for colored output
- **Image Generation**:
  - Pandoc
  - XeLaTeX
  - ImageMagick
  - IBM Plex Serif Light font
- **Terminal Image Display**: `viu` for inline images in Kitty, built-in support for iTerm2

## Supported Terminals

- **iTerm2** on macOS 
- **Kitty** on macOS or Linux 

## Prerequisites

- XeLaTeX (with IBM Plex Serif Light font)
- ImageMagick

## Getting Started

0. Clone this repository
1. Run `./install.sh` to install dependencies and set up the environment.
2. Run `rp` to start the interactive Ruby lessons.
3. Follow the on-screen instructions to navigate lessons and run examples/tests.
