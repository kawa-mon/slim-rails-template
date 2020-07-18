# project name <!-- バッジ -->

## 開発利用技術

| 項目                 | 内容                 |
| :------------------- | :------------------- |
| OS                   | macOS Mojave 10.14.6 |
| 言語                 | Ruby                 |
| バージョン管理ツール | rbenv                |
| フレームワーク       | Ruby on Rails        |
| データベース         | PostgreSQL           |

## 開発環境のセットアップ

1. gitclone

```
$ git clone git@github.com:○○○
```

2. bin/setup

```
$ bin/setup
```

3. DB のセットアップ

```
$ bin/rails db:create
$ bin/rails db:migrate
```

## 開発環境のバージョン

- Ruby -v 2.6.5
- Ruby on Rails -v 6.0.3.2

## 開発環境のログイン方法

<!--
  URL
  ログインアカウント情報
-->

## ドキュメント

<!-- ドキュメントへのリンク -->

## 開発ルール

<!-- 開発ルールへのリンク -->

<!-- その他
  便利コマンド集
  credentialの更新方法
  プロジェクト特有の注意点
-->

### GitHub 上でのプルリクベースの開発手法を採択

- プッシュ時に、CircleCI で、rubocop・brakeman・RSpec・simplecov が動作
- プルリクを上げてマージする方針とする
- プルリクフォーマットに則ること
- コミットメッセージはレビュアーが読んで内容を理解できる端的で分かりやすい日本語とする

### 開発作業の流れ

1. master ブランチから develop ブランチを作成
2. develop ブランチから実装する機能毎に feature ブランチを作成
3. feature ブランチで実装完了した機能は develop ブランチにマージ
4. リリース作業開始時点で、develop から release ブランチを作成
5. リリース作業完了時点で、release から develop, master ブランチにマージ

### リリース後の障害対応の流れ

1. master ブランチから hotfix ブランチを作成
2. hotfix ブランチで障害対応が完了した時点で、develop, master ブランチにマージ

### 登場するブランチ

- master
  - リリースした時点のソースコードを管理するブランチ
- develop (master から派生):
  - 開発作業の主軸となるブランチ
- feature (develop から派生):
  - 実装する機能毎のブランチ (feature/◯◯, feature/xx など)
- release (develop から派生):
  - develop での開発作業完了後、リリース時の微調整を行うブランチ
- hotfix (master から派生):
  - リリースされた製品に致命的なバグ(クラッシュなど)があった場合に緊急対応をするためのブランチ -

## 追加 gem の補足

- bullet
  - デフォルトで、development/test 環境では、N+1 がある場合は 500 になるようにしている
- [seed-fu](https://github.com/mbleigh/seed-fu)
  - db/fixtures 配下に初期データを DSL で書き、`$ bin/rails db:seed_fu` で作成・更新できる
- [settingslogic](https://github.com/binarylogic/settingslogic)
  - config/application.yml で定数を一元管理できる。 `Settings.hoge` の形式で呼び出せる
- [simplecov](https://github.com/colszowka/simplecov)
  - `$ bin/rspec` で coverage/index.html にテストカバレッジ結果を得られる
