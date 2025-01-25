#!/usr/bin/zsh

gum style \
  --foreground 202 --border-foreground 208 --border double \
  --align center --width 50 --margin "1 2" --padding "2 4" \
  '  Git pull --rebase and push'

echo "   "

gum style \
  --foreground 154 \
  --align center --width 50 --margin "2 2" --padding "1 1" \
  $'Executing \033[33mgit pull \033[90m--rebase\033[33m origin main\033[0m ...'

# Run git pull --rebase origin main and capture output
git pull --rebase origin main

# Check the exit status of git pull --rebase origin main
if [ $? -eq 0 ]; then
  echo "   "
  gum log --prefix=" " --level="info" --prefix.foreground="70" "git pull --rebase origin main completed successfully."

  echo "   "

  gum style \
    --foreground 154 \
    --align center --width 50 --margin "2 2" --padding "1 1" \
    $'Executing \033[33mgit push\033[33m origin main\033[0m ...'

  # Run git push origin main and capture output
  git push origin main

  # Check the exit status of git push origin main
  if [ $? -eq 0 ]; then
    echo "   "
    gum log --prefix=" " --prefix.foreground="70" --level="info" "git push origin main completed successfully."

    echo "   "

    gum style \
      --foreground 202 --border-foreground 208 --border double \
      --align center --width 50 --margin "1 2" --padding "2 4" \
      '   Git pull --rebase and push completed successfully.'
  else
    echo "   "
    gum log --prefix=" " --prefix.foreground="196" --level="error" "git push origin main failed."

    echo "   "

    gum style \
      --foreground 196 --border-foreground 160 --border double \
      --align center --width 50 --margin "1 2" --padding "2 4" \
      '   Git pull --rebase succeeded, but push failed.'
  fi

else
  echo "   "
  gum log --prefix=" " --level="error" --prefix.foreground="196" "git pull --rebase origin main failed. Skipping git push."

  echo "   "

  gum style \
    --foreground 196 --border-foreground 160 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    '   Git pull --rebase and push operation failed.'
fi

echo "   "

# End of script
