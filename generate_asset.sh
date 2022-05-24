echo ""
echo "___________________________________________________"
echo "Re-generating assets..."
echo ""

fvm use 3.0.1 --force
cd "$(dirname "$0")/manifest" || return
fvm flutter pub run assets:generate

echo ""
echo "___________________________________________________"
echo "All tasks are finished"
echo ""