#!/usr/bin/env bash
#
# tbjers/flutter ellipsis package

FLUTTER_VERSION=v1.0.0-stable
FLUTTER_FILE="flutter_macos_${FLUTTER_VERSION}.zip"
FLUTTER_DIRECTORY=$HOME/flutter

pkg.install() {
  brew update
  brew install --HEAD usbmuxd
  brew link usbmuxd
  brew install --HEAD libimobiledevice
  brew install ideviceinstaller
  brew install ios-deploy
  brew install cocoapods
  pod setup
  [ ! -d "$FLUTTER_DIRECTORY" ] && mkdir -p "$FLUTTER_DIRECTORY" && \
    curl -o "/tmp/{$FLUTTER_FILE}" "https://storage.googleapis.com/flutter_infra/releases/stable/macos/${FLUTTER_FILE}" && \
    cd "$(dirname "$FLUTTER_DIRECTORY")" || exit "Could not enter base directory to install Flutter." && \
    unzip "/tmp/${FLUTTER_FILE}" && \
    cd "${FLUTTER_DIRECTORY}" || exit "Could not enter Flutter directory." && \
    [ ! -f "${FLUTTER_DIRECTORY}/bin/flutter" ] && exit "Could not find Flutter binary." && \
    $("${FLUTTER_DIRECTORY}/bin/flutter") doctor -v
}

# The following hooks can be defined to customize behavior of your package:
# pkg.install() {
#     fs.link_files $PKG_PATH
# }

# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
