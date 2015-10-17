class Ishizue::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_misc_directories
    empty_directory 'misc/ssh_keys'
  end

  def copy_itamae_templates
    directory 'itamae', 'misc/itamae'
  end

  def copy_capistrano_templates
    directory 'capistrano', 'misc/capistrano'
  end

  def generate_templates
    @app_name = Rails.application.class.name.gsub(/^(\w+)::Application$/, '\1').underscore
    empty_directory "misc/itamae/cookbooks/#{@app_name}"
    template 'erbs/default.rb.erb', "misc/itamae/cookbooks/#{@app_name}/default.rb"
    directory 'files', "misc/itamae/cookbooks/#{@app_name}/files"
    template 'erbs/monitor.conf.erb', "misc/itamae/cookbooks/#{@app_name}/files/etc/nginx/conf.d/monitor.conf"
    template 'erbs/deploy.rb.erb', 'misc/capistrano/config/deploy.rb'
    template 'erbs/staging.rb.erb', 'misc/itamae/roles/staging.rb'
    template 'erbs/ishizue.rake.erb', 'misc/capistrano/lib/capistrano/tasks/ishizue.rake'
  end

  def append_gems
    gem 'sinatra'
    gem 'sidekiq'
    gem 'figaro'
    gem 'whenever'
    gem 'puma'
  end
end
