const path = require('path');

module.exports = {
  mode: 'development', // 'production' も利用可能
  entry: './src/index.js', // プロジェクトのエントリーポイントを指定
  output: {
    filename: 'bundle.js', // 出力されるファイル名
    path: path.resolve(__dirname, 'dist'), // 出力ディレクトリ
  },
  module: {
    rules: [
      {
        test: /\.js$/, // JavaScriptファイルを対象
        exclude: /node_modules/, // node_modulesは除外
        use: {
          loader: 'babel-loader', // Babelを利用してトランスパイル
        },
      },
    ],
  },
  node: false, // 不要なNode.jsポリフィルを無効化
};