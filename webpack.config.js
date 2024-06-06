const path = require('path');
const glob = require('glob');
const webpack = require('webpack');

module.exports = {
  mode: 'production',
  entry: './app/javascript/packs/application.js',
  output: { // バンドルされたファイルの出力先とファイル名
    filename: 'main.js',
    path: path.resolve(__dirname, 'public/packs'),
  },
};
