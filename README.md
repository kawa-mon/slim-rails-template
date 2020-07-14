# slim-rails-template
## 概要
これは、Railsアプリケーションを作る際にテンプレートとして使用することで、  
新しいプロジェクトに、高速に必要不可欠なgemや設定を組み込むことができるテンプレートです。

## なぜ作ったか
自分のサービスでも、会社のサービスでも、テンプレートを使わない場合は、  
rails newをした後に、その個人・組織のルールに則り、アプリケーションの設定をいくつも追加すると思います。  
テンプレートとして、必要な設定を全て網羅していれば、素早く、モレなく、設定が完了します。  

## 事前準備
このテンプレートは以下のバージョンで動くことを保証しています。  

- PostgreSQL
- ruby 2.6.5
- Rails 6.0.x

手元の環境に上記のバージョンを用意して、お試しください。

## 使用方法
1. gitclone  
```
$ git clone https://github.com/kawa-mon/rails-template.git
```

2. rails new
```
$ rails new . -T -d postgresql -m [path to your rails-template]
```

3. 作られた todo.md に沿って、必要な設定を追加

## 追加しているgem
- annotate系
- awesome_print
- better_errors
- brakeman
- bullet  
  デフォルトで、development/test環境では、N+1がある場合は500になるようにしています。
- factory_bot_rails
- kaminari
- [meta-tags](https://github.com/kpumuk/meta-tags)
  - SEO対策用gem
- pg
- pry系
- rails-erd
- rails-flog
- rspec系
- rubocop系
- [seed-fu](https://github.com/mbleigh/seed-fu)
  - db/fixtures 配下に初期データをDSLで書き、`$ bin/rails db:seed_fu` で作成・更新できる
- [settingslogic](https://github.com/binarylogic/settingslogic)
  - config/application.yml で定数を一元管理できる。 `Settings.hoge` の形式で呼び出せる
- [simplecov](https://github.com/colszowka/simplecov)
  - `$ bin/rspec` で coverage/index.html にテストカバレッジ結果を得られる
- slim系
