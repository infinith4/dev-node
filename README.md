主要コンポーネント:

   1. Dockerfile: 開発環境のベースイメージを定義します。mcr.microsoft.com/vscode/devcontainers/base
      を使用し、Node.js、npm、およびグローバルに @qwen-code/qwen-code CLI をインストールしています。
   2. docker-compose.yml: 開発コンテナ dev-node-app を定義します。Dockerfile からビルドされ、ホストの .ssh
      キーやソースコードディレクトリ (/src)
      をボリュームとしてマウントします。ネットワークモードはホストを使用し、コンテナは無限ループ (sleep infinity)
      で実行され、終了しないようにしています。
   3. .devcontainer/devcontainer.json: VS Code Dev Containers 機能の設定ファイルです。Docker Compose
      ファイルを使用してコンテナを起動するように指定し、dev-node-app
      サービスをターゲットとしています。Docker-in-Docker、Python、TypeScript
      などの機能を追加しています。ワークスペースフォルダは /src に設定されており、VS Code 拡張機能
      (Anthropic.claude-code) のインストールもカスタマイズされています。

  アーキテクチャ:

  この環境は、VS Code Dev Containers を利用したコンテナ化された開発環境です。

   * ローカルの VS Code は、定義された Docker コンテナにアタッチして開発を行います。
   * コンテナ内には、アプリケーション開発に必要なツール群（Node.js, npm, Qwen Code CLI, Python, Docker
     クライアント）が事前にインストールされています。
   * ホストマシンのソースコードはボリュームマウントされているため、コンテナ内外でのファイルの編集が同期されます。
   * ホストネットワークを使用しているため、コンテナ内のアプリケーションはホストマシンのネットワークインターフェース
     を直接利用できます。