copy_file 'config/application.yml'

copy_file 'config/initializers/0_settings.rb'
copy_file 'config/initializers/generators.rb'

copy_file 'config/environment.rb'
copy_file 'config/puma.rb'

insert_into_file 'config/environments/development.rb', before: /\nend\n\z/ do
  <<-'RUBY'
  # N + 1はポップアップ通知させる
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end

  # ログの整形
  config.logger = Logger.new(config.paths['log'].first)
  config.logger.formatter = Logger::Formatter.new
  RUBY
end

insert_into_file 'config/environments/test.rb', before: /\nend\n\z/ do
  <<-'RUBY'
  # N + 1はポップアップ通知させる
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end
  RUBY
end

insert_into_file 'config/application.rb', before: /^  end/ do
  <<-'RUBY'
    # DBのタイムゾーン設定
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local

    # Libディレクトリの読み込み
    config.paths.add 'lib', eager_load: true

    # テンプレートエンジンをslimに設定
    config.generators.template_engine = :slim

    # 国際化の設定
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]
    config.i18n.available_locales = %i[ja]
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :ja
  RUBY
end
