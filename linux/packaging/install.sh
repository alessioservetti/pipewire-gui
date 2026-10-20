#!/usr/bin/env bash
# Installs, for the current user, the app icon (hicolor theme, name "pipewire-gui") and the
# desktop entry pointing at the release bundle. The entry is named after APPLICATION_ID
# (linux/CMakeLists.txt): on Wayland that is how Plasma finds the icon of the window.
# Run after `flutter build linux --release`; run again if the project moves.
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cmake="$root/linux/CMakeLists.txt"
app_id="$(sed -n 's/^set(APPLICATION_ID "\(.*\)")$/\1/p' "$cmake")"
binary="$(sed -n 's/^set(BINARY_NAME "\(.*\)")$/\1/p' "$cmake")"
case "$(uname -m)" in
  aarch64 | arm64) arch=arm64 ;;
  *) arch=x64 ;;
esac
bundle="$root/build/linux/$arch/release/bundle"

if [[ -z "$app_id" || -z "$binary" ]]; then
  echo "APPLICATION_ID / BINARY_NAME not found in $cmake" >&2
  exit 1
fi
if [[ ! -x "$bundle/$binary" ]]; then
  echo "Missing $bundle/$binary: run 'flutter build linux --release' first" >&2
  exit 1
fi

data="${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "$data/icons" "$data/applications"
cp -r "$root/linux/packaging/icons/hicolor" "$data/icons/"
sed -e "s|@BUNDLE@|$bundle|" -e "s|@BINARY@|$binary|" -e "s|@APP_ID@|$app_id|" \
  "$root/linux/packaging/pipewire-gui.desktop" > "$data/applications/$app_id.desktop"

update-desktop-database -q "$data/applications" 2>/dev/null || true

echo "Icon:          $data/icons/hicolor/*/apps/pipewire-gui.*"
echo "Desktop entry: $data/applications/$app_id.desktop"
