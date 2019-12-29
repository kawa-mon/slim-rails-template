copy_file 'config/environment.rb'

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
