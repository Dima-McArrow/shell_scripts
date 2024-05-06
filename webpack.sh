# webpack installation
function install_webpack() {
  echo -e "\n\t  Creating project structure ..."
  mkdir src static
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  echo -e "\n\t2 folders created  "
  echo -e "\n\t Copying config files into bundler folder ...\n"
  # cp ~/webpack_config/bundler/webpack.common.js ~/webpack_config/bundler/webpack.dev.js ~/webpack_config/bundler/webpack.prod.js bundler/ 
  gdown --folder "https://drive.google.com/drive/folders/1-7TFJ38_Ze1Gwano2yf4x9J2Tet8hVMq"
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  echo -e "\n\t3 config files now in bundler folder      "
  echo -e "\n\t  Initializing project    \u001B[31m\u001B[0m\n"
  npm init -y 
  echo -e "\n\t  Installing  \u001B[36m󰜫\u001B[0m  ...\n"
  npm install --save-dev webpack webpack-cli webpack-dev-server webpack-merge clean-webpack-plugin copy-webpack-plugin @babel/core @babel/preset-env babel-loader css-loader file-loader html-loader html-webpack-plugin mini-css-extract-plugin portfinder-sync raw-loader style-loader ip sass sass-loader
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  echo -e "\n\tInstalled by  \u001B[31m\u001B[0m  : \u001B[36m󰜫\u001B[0m webpack, \u001B[36m󰜫\u001B[0m webpack-cli, \u001B[36m󰜫\u001B[0m webpack-dev-server, \u001B[36m󰜫\u001B[0m webpack-merge, \u001B[36m󰜫\u001B[0m clean-webpack-plugin, \u001B[36m󰜫\u001B[0m copy-webpack-plugin, \u001B[33m󰨥\u001B[0m @babel/core, \u001B[33m󰨥\u001B[0m @babel/preset-env, \u001B[33m󰨥\u001B[0m babel-loader, \u001B[34m\u001B[0m css-loader, file-loader, \u001B[31m\u001B[0m html-loader, \u001B[31m\u001B[0m html-webpack-plugin, \u001B[34m\u001B[0m mini-css-extract-plugin, portfinder-sync, raw-loader, style-loader, ip, \u001B[35m\u001B[0m sass, \u001B[35m\u001B[0m sass-loader"
  node -e "const packageJson = require('./package.json'); packageJson.scripts = { ...packageJson.scripts, start: 'webpack serve --config ./bundler/webpack.dev.js', build: 'webpack --config ./bundler/webpack.prod.js' }; require('fs').writeFileSync('./package.json', JSON.stringify(packageJson, null, 2));"
  echo -e "\n\t\u001B[33mpackage.json\u001B[0m file was updated successfully by \u001B[32m󰎙\u001B[0m"
  echo -e "\n\n\t\u001B[31m\u001B[0m    \u001B[32mnpm\u001B[0m run start    serve the project"
  echo -e "\n\t\u001B[31m\u001B[0m    \u001B[32mnpm\u001B[0m run build    make a build of the project\n"
}