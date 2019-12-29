def setup_rails_apllication!
  puts '== Start setup_rails_apllication!  🏃👍  =='

  setup_source_paths

  template 'Gemfile', force: true
  copy_file 'README.sample.md', 'README.md', force: true
  remove_unuse_files
  create_use_files

  puts '== Finish setup_rails_apllication!  ✨🎉  =='
end

def remove_unuse_files
  remove_dir 'app/channels'
  remove_dir 'app/jobs'
  remove_file 'config/cable.yml'
  remove_file 'config/locales/en.yml'
  remove_dir 'storage'
  remove_dir 'test'
end

def create_use_files
  copy_file '.circleci/config.yml'
  copy_file '.gitignore'
  copy_file '.pryrc'
  copy_file '.rspec'
  copy_file '.rubocop.yml'
  copy_file 'todo.md'
  copy_file 'PULL_REQUEST_TEMPLATE.md'
  copy_file 'Procfile'

  apply 'bin/template.rb'
  apply 'config/template.rb'
  apply 'spec/template.rb'
end

# rails newだけで即座にsample pageを作れた方が、DX的にありがたいので、
# setupやscaffoldをrails newの中で行う
def run_rails_setup_commands!
  puts '== Start run_rails_setup_commands!  🚴💪  =='
  run 'curl -s https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -o config/locales/ja.yml'
  run 'bundle exec erb2slim app/views/layouts/ --delete'
  run 'bundle exec rails g erd:install'
  run 'bundle exec rails generate meta_tags:install'
  run 'bin/rails g annotate:install'
  copy_file 'lib/tasks/auto_annotate_models.rake'
  copy_file 'lib/tasks/auto_generate_diagram.rake'
  rails_command 'db:create'
  rails_command 'db:migrate'
  run 'bin/setup'
  run 'bin/webpack'
  puts '== Finish run_rails_setup_commands!  ✨🎊  =='
end

def scaffold_sample_pages
  return unless yes? 'need example page? [y/n]'

  generate(:scaffold, 'book name:string')
  route "root to: 'books#index'"
  route 'resources :books'
end

def git_commit
  return unless yes? 'git commit? [y/n]'

  git :init
  git add: '-A .'
  git commit: %( -m '🎁 Initial commit' )
end

# https://github.com/erikhuda/thor/blob/2115b7accb42e0acca330ba694552322386994a5/lib/thor/actions.rb#L127
# source_pathsメソッドを上書きしてテンプレートの位置を指定し、
# templateメソッドやcopy_fileメソッドでテンプレートの位置からの相対パスを指定できるようにする
# 参考: https://railsguides.jp/rails_application_templates.html#%E9%AB%98%E5%BA%A6%E3%81%AA%E5%88%A9%E7%94%A8%E6%B3%95
def setup_source_paths
  source_paths.unshift File.dirname __FILE__
end

setup_rails_apllication!

after_bundle do
  run_rails_setup_commands!
  scaffold_sample_pages
  git_commit
end
