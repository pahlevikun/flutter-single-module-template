cd "$(dirname "$0")/main" || return
fvm use 3.0.1 --force
fvm flutter build apk --release --no-sound-null-safety