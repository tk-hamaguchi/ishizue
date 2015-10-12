Ishizue
========




Getting start with Vagrant
--------

1. Add your Gemfile

  ```
  group :development do
      gem 'ishizue', github: 'tk-hamaguchi/ishizue'
  end
  ```

2. Added .ruby-versions. (ex: ruby `2.2` with gemset `sample`)

  ```
  $ rvm use 2.2@sample --install --create --ruby-version
  ```

3. Install and generate templates

  ```
  $ gem install bundler --no-ri --no-rdoc 
  $ bundle install
  $ bundle exec rails g ishizue:install
  ```

4. Added SSH Keys

  ```
  $ cp ~/.ssh/id_rsa.pub misc/ssh_keys
  ```

5. Vagrant up

  ```
  $ cd misc/itamae/
  $ vagrant up
  ```

6. Setup with Itamae

  ```
  $ bundle exec itamae ssh -h 192.168.33.10 -u root --ohai roles/staging.rb --node-yaml=nodes/staging.yml
        INFO : Starting Itamae...
        root@192.168.33.10's password: 
  ```

  password => `vagrant`

7. Access with Web browser

  | Site       | URL                       |
  |:----------:|:--------------------------|
  | Main       | http://192.168.33.10      |
  | Monitoring | http://192.168.33.10:8282 |


Change target host
--------

1. Edit Capistrano deploy config

```
vi misc/capistrano/config/deploy/staging.rb
	server 'YOUR_SERVER_IP', user: 'deploy', roles: %w{app db web}
```

2. Execute new ip with itamae

```
cd misc/itamae/
itamae ssh -h YOUR_SERVER_IP -u root --ohai roles/staging.rb --node-yaml=nodes/staging.yml
```


