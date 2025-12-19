## Ruby Primer Agent Instructions

### Installation

- **Prerequisites**: Ruby 3.2+, pandoc, xelatex, imagemagick, viu, IBM Plex Serif Light font.
- **Setup**: Run `./install.sh` to install Ruby gems, utilities, and configure the app.

### Build, Lint, and Test

- **Ruby Version**: Requires Ruby 3.2 or higher.
- **Testing**: This project uses RSpec.
  - Run all tests: `bundle exec rspec`
  - Run a single test file: `bundle exec rspec examples_spec/0.0.2.rb`
- **Linting**: There is no linting configuration. Please adhere to the style of existing code.
- **CI**: GitHub Actions run Ruby and JSON syntax checks on pull requests (`.github/workflows/ruby-syntax.yml` and `json-syntax.yml`). Checks run on all PRs and validate `.rb` files, `rp`, and `.json` files using `ruby -c` and `jq`.

### Code Style

- **Formatting**: Use 2-space indentation.
- **Naming**: Use `snake_case` for variables and methods.
- **Strings**: Use double quotes for strings, especially with interpolation. Use single quotes for `require` statements.
- **Methods**: Use parentheses for method definitions with arguments.
- **Imports**: Use `require`.
- **Types**: Not specified.
- **Terminal Support**: Check for minimum 135 columns x 40 rows at startup. Detect Kitty or iTerm2 for image display; generate PDFs/PNGs for formatted text.
- **General**: Follow existing patterns in the code. Explicit `return` is preferred.
