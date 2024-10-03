#!/usr/bin/zsh

gum style \
    --foreground 212 --border-foreground 35 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    '󰎙 |  ' 'Setup Node.js and Express project' 'managed by npm'

# Request the project name using gum input
PROJECT_EX_NAME=$(gum input \
    --header="󰎙 |  " \
    --placeholder="Enter the project name:" \
    --prompt.foreground="25" \
    --header.foreground="76" \
    --placeholder.foreground="25" \
    --prompt=" " \
    --width=80)

# Check if the input is empty and exit if true
if [[ -z "$PROJECT_EX_NAME" ]]; then
    echo "  No input provided. Exiting..." | gum style --foreground="124"
    exit 1
fi

# Create the project directory and navigate into it
mkdir "$PROJECT_EX_NAME" && cd "$PROJECT_EX_NAME"

# Display project structure creation message
echo "  Project structure:" | gum style --foreground="25" --padding 1 --margin 1

# Create project structure
mkdir -p public/{HTML,styles,scripts} server/{routes,controllers,middleware,config}

# List the directory structure
ls | gum style --foreground="76" --border rounded --padding 1 --margin 1

echo "\n"

# Initialize npm and install dependencies
npm init -y | gum format -t code -l json

npm i bcryptjs body-parser cookie-parser cors dotenv express express-rate-limit express-validator helmet morgan multer path sass mysql2 sequelize

# Add run script to package.json
node -e "const packageJson = require('./package.json'); packageJson.scripts = { ...packageJson.scripts, run: 'node server/app.js' }; require('fs').writeFileSync('./package.json', JSON.stringify(packageJson, null, 2));"

# Display the updated package.json content
echo "Wrote to package.json:" | gum style --foreground="34" --padding 1 --margin 1

gum format -t code -l json < ./package.json

# Success message
echo " Success!" | gum style --padding 1 --margin 1 --foreground="70"

echo "\n"

# Display the installed dependencies
echo "Installed dependencies:" | gum style --foreground="33" --padding 1 --margin 1
echo "bcryptjs body-parser cookie-parser cors dotenv express express-rate-limit express-validator helmet morgan multer path sass mysql2 sequelize" | gum style --padding 1

echo "\n"

# Display the next steps
echo "now enter the following command to run the project in VSCode:" | gum style --foreground="33" --padding 1 --margin 1
echo "\u001B[32mcode\u001B[0m "$PROJECT_EX_NAME | gum style --padding 1
