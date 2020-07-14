# slim-rails-template

## 概要

これは、Rails アプリケーションを作る際にテンプレートとして使用することで、  
新しいプロジェクトに、高速に必要不可欠な gem や設定を組み込むことができるテンプレートです。

## なぜ作ったか

自分のサービスでも、会社のサービスでも、テンプレートを使わない場合は、  
rails new をした後に、その個人・組織のルールに則り、アプリケーションの設定をいくつも追加すると思います。  
テンプレートとして、必要な設定を全て網羅していれば、素早く、モレなく、設定が完了します。

## 事前準備

このテンプレートは以下のバージョンで動くことを保証しています。

- PostgreSQL
- ruby 2.6.5
- Rails 6.0.x

手元の環境に上記のバージョンを用意して、お試しください。

## 使用方法

1. mkdir [your app name]
1. cd [you app name]
1. git clone

   ```
   $ git clone git@github.com:kawa-mon/slim-rails-template.git
   ```

1. rails new

   ```
   $ rails new . -T -d postgresql -m [path to this template repository's "tempalte.rb"]
   e.g) rails new . -T -d postgresql -m ../slim-rails-template/template.rb
   ```

1. 作られた todo.md に沿って、必要な設定を追加

## 追加している gem

- annotate 系
- awesome_print
- better_errors
- brakeman
- bullet  
  デフォルトで、development/test 環境では、N+1 がある場合は 500 になるようにしています。
- factory_bot_rails
- kaminari
- [meta-tags](https://github.com/kpumuk/meta-tags)
  - SEO 対策用 gem
- pg
- pry 系
- rails-erd
- rails-flog
- rspec 系
- rubocop 系
- [seed-fu](https://github.com/mbleigh/seed-fu)
  - db/fixtures 配下に初期データを DSL で書き、`$ bin/rails db:seed_fu` で作成・更新できる
- [settingslogic](https://github.com/binarylogic/settingslogic)
  - config/application.yml で定数を一元管理できる。 `Settings.hoge` の形式で呼び出せる
- [simplecov](https://github.com/colszowka/simplecov)
  - `$ bin/rspec` で coverage/index.html にテストカバレッジ結果を得られる
- slim 系
