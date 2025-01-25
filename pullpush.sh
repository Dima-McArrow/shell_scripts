#!/usr/bin/zsh

gum style \
  --foreground 212 \
  --align center --width 50 --margin "2 2" --padding "1 1" \
  '  Git pull --rebase and push'

echo "   "

gum style \
  --foreground 154 \
  --align center --width 50 --margin "2 2" --padding "1 1" \
  '   Executing git pull --rebase origin main ...'

# Run git pull --rebase origin main and capture output
git pull --rebase origin main

# Check the exit status of git pull --rebase origin main
if [ $? -eq 0 ]; then
  echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "git pull --rebase origin main completed successfully."
else
  echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "git pull --rebase origin main failed."
fi

echo "   "

gum style \
  --foreground 154 \
  --align center --width 50 --margin "2 2" --padding "1 1" \
  '   Executing git push origin main ...'

# Run git push origin main and capture output
git push origin main

# Check the exit status of git push origin main
if [ $? -eq 0 ]; then
  echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "git push origin main completed successfully."
else
  echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "git push origin main failed."
fi

echo "   "

gum style \
  --foreground 212 \
  --align center --width 50 --margin "2 2" --padding "1 1" \
  '   Git pull --rebase and push completed.'

echo "   "

# End of script