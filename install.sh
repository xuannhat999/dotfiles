#!/bin/bash

set -e
mkdir -p ~/Pictures/Wallpapers/
cp wallpaper1.jpg ~/Pictures/Wallpapers/
echo "--- Bắt đầu cài đặt Dotfiles ---"

sudo pacman -Syu --noconfirm

PACKAGES=(
  # CORE
  "neovim"
  "stow"
  "kitty"
  "waybar"
  "hyprland"
  "gnome-keyring"
  "fcitx5-bamboo"
  "swaybg"
  "bluez"
  "swayidle"
  "swaylock"
  "swayimg"
  "bluez-utils"
  "pipewire-pulse"
  "wirepluber"
  "greetd"
  "greetd-tuigreet"
  "7zip"
  "zip"
  "unzip"
  # TUI MANAGER
  "wiremix"
  "bluetui"
  "impala"
  "yazi"
  "mako"
  "rofi"
  "rofi-calc"
  # THEME
  "papirus-icon-theme"
  "ttf-jetbrains-mono-nerd"
  "noto-fonts-cjk"
  "ttf-ms-fonts"
  # UTILS
  "tree-sitter"
  "libreoffice-fresh"
  "starship"
  "fzf"
  "zoxide"
  "lazygit"
  "lazydocker"
  "zathura"
  "zathura-pdf-mupdf"
  "fastfetch"
  "btop"

)

echo "Đang cài đặt các package từ Pacman..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

if ! command -v yay &>/dev/null; then
  echo "Đang cài đặt yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
  cd -
fi

AUR_PACKAGES=(
  "catppuccin-gtk-theme-mocha"
  "brave-origin-bin"
  "android_studio"
)

echo "Đang cài đặt các package từ AUR..."
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
echo "--- Cài đặt hoàn tất! ---"
