#!/bin/bash
set -euo pipefail

install_jq() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command -v brew >/dev/null 2>&1; then
            echo "Installing jq using Homebrew..."
            brew install jq
        else
            echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
            exit 1
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v apt-get >/dev/null 2>&1; then
            echo "Installing jq using apt-get..."
            sudo apt-get update && sudo apt-get install -y jq
        elif command -v yum >/dev/null 2>&1; then
            echo "Installing jq using yum..."
            sudo yum install -y jq
        elif command -v dnf >/dev/null 2>&1; then
            echo "Installing jq using dnf..."
            sudo dnf install -y jq
        elif command -v zypper >/dev/null 2>&1; then
            echo "Installing jq using zypper..."
            sudo zypper install -y jq
        elif command -v pacman >/dev/null 2>&1; then
            echo "Installing jq using pacman..."
            sudo pacman -S --noconfirm jq
        else
            echo "Unable to detect package manager. Please install jq manually."
            exit 1
        fi
    else
        echo "Unsupported operating system: $OSTYPE"
        exit 1
    fi
}

install_npm() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command -v brew >/dev/null 2>&1; then
            echo "Installing npm using Homebrew..."
            brew install node
        else
            echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
            exit 1
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v apt-get >/dev/null 2>&1; then
            echo "Installing npm using apt-get..."
            sudo apt-get update && sudo apt-get install -y nodejs npm
        elif command -v yum >/dev/null 2>&1; then
            echo "Installing npm using yum..."
            sudo yum install -y nodejs npm
        elif command -v dnf >/dev/null 2>&1; then
            echo "Installing npm using dnf..."
            sudo dnf install -y nodejs npm
        elif command -v zypper >/dev/null 2>&1; then
            echo "Installing npm using zypper..."
            sudo zypper install -y nodejs npm
        elif command -v pacman >/dev/null 2>&1; then
            echo "Installing npm using pacman..."
            sudo pacman -S --noconfirm nodejs npm
        else
            echo "Unable to detect package manager. Please install npm manually."
            exit 1
        fi
    else
        echo "Unsupported operating system: $OSTYPE"
        exit 1
    fi
}

# Check if jq is installed
if ! command -v jq >/dev/null 2>&1; then
    echo "jq is not installed. Attempting to install..."
    install_jq
else
    echo "jq is already installed."
fi

# Verify jq installation
if command -v jq >/dev/null 2>&1; then
    echo "jq has been successfully installed or was already present."
    jq --version
else
    echo "Failed to install jq. Please install it manually."
    exit 1
fi

# Check for JavaScript package managers
if command -v pnpm >/dev/null 2>&1; then
    echo "pnpm is installed."
elif command -v npm >/dev/null 2>&1; then
    echo "npm is installed."
elif command -v bun >/dev/null 2>&1; then
    echo "bun is installed."
elif command -v yarn >/dev/null 2>&1; then
    echo "yarn is installed."
else
    echo "No JavaScript package manager found. Attempting to install npm..."
    install_npm
fi

# Verify npm installation if it was installed
if ! command -v pnpm >/dev/null 2>&1 && ! command -v bun >/dev/null 2>&1 && ! command -v yarn >/dev/null 2>&1; then
    if command -v npm >/dev/null 2>&1; then
        echo "npm has been successfully installed."
        npm --version
    else
        echo "Failed to install npm. Please install it manually."
        exit 1
    fi
fi