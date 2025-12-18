#!/bin/bash

# Ruby Primer Installer
# Detects dependencies and installs the Ruby Primer app.

REQUIRED_RUBY_VERSION="3.2"
REQUIRED_UTILITIES=("pandoc" "xelatex" "convert" "viu")
FONT_NAME="IBM Plex Serif Light"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Ruby Primer Installer"
echo "====================="

# Detect OS
OS=$(uname -s)
case "$OS" in
    Darwin)
        PACKAGE_MANAGER="brew"
        ;;
    Linux)
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case "$ID" in
                ubuntu|debian)
                    PACKAGE_MANAGER="apt"
                    ;;
                centos|rhel|fedora)
                    PACKAGE_MANAGER="yum"
                    ;;
                *)
                    PACKAGE_MANAGER="unknown"
                    ;;
            esac
        else
            PACKAGE_MANAGER="unknown"
        fi
        ;;
    *)
        echo -e "${RED}Unsupported OS: $OS${NC}"
        exit 1
        ;;
esac

echo "Detected OS: $OS (Package manager: $PACKAGE_MANAGER)"

# Detect Ruby
detect_ruby() {
    local ruby_paths=("/usr/bin/ruby" "/usr/bin/ruby$REQUIRED_RUBY_VERSION" "/usr/local/bin/ruby" "/opt/homebrew/bin/ruby" "/opt/homebrew/opt/ruby@$REQUIRED_RUBY_VERSION/bin/ruby")
    for path in "${ruby_paths[@]}"; do
        if [ -x "$path" ]; then
            local version=$( { "$path" --version 2>/dev/null || echo "ruby 0.0.0"; } | grep -oE '[0-9]+\.[0-9]+' | head -1 || echo "0.0" )
            if [ "$(printf '%s\n' "$REQUIRED_RUBY_VERSION" "$version" | sort -V | head -1)" = "$REQUIRED_RUBY_VERSION" ]; then
                echo "$path"
                return 0
            fi
        fi
    done
    return 0
}

RUBY_PATH=$(detect_ruby)
if [ -z "$RUBY_PATH" ]; then
    echo -e "${RED}Ruby $REQUIRED_RUBY_VERSION+ not found.${NC}"
    case "$PACKAGE_MANAGER" in
        brew)
            echo "Install with: brew install ruby@$REQUIRED_RUBY_VERSION"
            ;;
        apt)
            echo "Install with: sudo apt update && sudo apt install ruby$REQUIRED_RUBY_VERSION"
            ;;
        yum)
            echo "Install with: sudo yum install ruby"
            ;;
        *)
            echo "Please install Ruby $REQUIRED_RUBY_VERSION+ manually."
            ;;
    esac
    exit 1
fi

echo "Detected Ruby: $RUBY_PATH"

# Update rp shebang
if [ -w rp ]; then
    sed -i.bak "1s|.*|#!/$RUBY_PATH|" rp
    echo "Updated rp shebang to use $RUBY_PATH"
else
    echo "Warning: Could not update rp shebang (file not writable)"
fi

# Install gems
echo "Installing Ruby gems..."
# Note: If using system Ruby, gem installs may require sudo.
# For better isolation, consider installing Ruby via rbenv or asdf.
sudo "$RUBY_PATH" -S gem install bundler
sudo "$RUBY_PATH" -S bundle install --path vendor/bundle

# Check utilities
missing_utils=()
for util in "${REQUIRED_UTILITIES[@]}"; do
    if ! command -v "$util" &> /dev/null; then
        missing_utils+=("$util")
    fi
done

if [ ${#missing_utils[@]} -ne 0 ]; then
    echo -e "${YELLOW}Missing utilities: ${missing_utils[*]}${NC}"
    case "$PACKAGE_MANAGER" in
        brew)
            echo "Install with: brew install pandoc mactex imagemagick viu"
            echo "Note: Ensure IBM Plex Serif Light font is available (included in mactex or install separately)."
            ;;
        apt)
            echo "Install with: sudo apt update && sudo apt install pandoc texlive-latex-base texlive-fonts-recommended imagemagick && cargo install viu"
            echo "Note: Ensure IBM Plex Serif Light font is installed (may require additional font packages)."
            ;;
        yum)
            echo "Install with: sudo yum install pandoc texlive texlive-fonts ImageMagick && cargo install viu"
            echo "Note: Ensure IBM Plex Serif Light font is installed."
            ;;
        *)
            echo "Please install pandoc, xelatex, imagemagick, and viu manually (viu via 'cargo install viu')."
            echo "Note: Ensure IBM Plex Serif Light font is available for xelatex."
            ;;
    esac
    exit 1
fi

# Check font
check_font() {
    case "$OS" in
        Darwin)
            # On macOS, check if font is installed via system_profiler or find
            if command -v system_profiler &> /dev/null; then
                system_profiler SPFontsDataType 2>/dev/null | grep -q "$FONT_NAME"
            else
                find /Library/Fonts ~/Library/Fonts -name "*plex*serif*" -type f 2>/dev/null | grep -q -i light
            fi
            ;;
        Linux)
            # On Linux, use fc-list if available
            if command -v fc-list &> /dev/null; then
                fc-list | grep -q "$FONT_NAME"
            else
                find /usr/share/fonts -name "*plex*serif*" -type f 2>/dev/null | grep -q -i light
            fi
            ;;
        *)
return 0
            ;;
    esac
}

if ! check_font; then
    echo -e "${YELLOW}IBM Plex Serif Light font not found.${NC}"
    case "$PACKAGE_MANAGER" in
        brew)
            echo "Install with: brew install font-ibm-plex"
            ;;
        apt)
            echo "Install with: sudo apt install fonts-ibm-plex"
            ;;
        yum)
            echo "Install with: sudo yum install ibm-plex-fonts"
            ;;
        *)
            echo "Please install IBM Plex Serif Light font manually."
            ;;
    esac
    exit 1
fi

echo "IBM Plex Serif Light font found."

# Install rp and data files
INSTALL_DIR="$HOME/.local/bin"
DATA_DIR="$HOME/.local/share/rubyprimer"
mkdir -p "$INSTALL_DIR" "$DATA_DIR"
cp rp "$INSTALL_DIR/rp"
chmod +x "$INSTALL_DIR/rp"
echo "Installed rp to $INSTALL_DIR"

# Copy data files
cp -r examples examples_spec lessons lib fonts AGENTS.md Gemfile Gemfile.lock README.md "$DATA_DIR/"
echo "Installed data files to $DATA_DIR"

# Update PATH
SHELL_RC=""
case "$SHELL" in
    */bash)
        SHELL_RC="$HOME/.bashrc"
        ;;
    */zsh)
        SHELL_RC="$HOME/.zshrc"
        ;;
    *)
        SHELL_RC="$HOME/.bashrc"
        ;;
esac

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$SHELL_RC"
    echo "Updated $SHELL_RC to include $INSTALL_DIR in PATH"
    echo "Please run 'source $SHELL_RC' or restart your shell."
fi

echo -e "${GREEN}Installation complete! Run 'rp' to start.${NC}"