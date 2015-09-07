Ishizue
========




Getting start with Vagrant
--------

1. Add your Gemfile

```
group :development do
  gem 'itamae-plugin-recipe-rvm', github: 'tk-hamaguchi/itamae-plugin-recipe-rvm', require: false
  gem 'ishizue', github: 'tk-hamaguchi/ishizue'
end
```

2. Install and generate templates

```
bundle install
bundle exec rails g ishizue:install
```

3. Added SSH Keys

```
cp ~/.ssh/id_rsa.pub misc/ssh_keys
```

4. Vagrant up

```
cd misc/itamae/
vagrant up
```

5. Setup with Itamae

```
itamae ssh -h 192.168.33.10 -u root --ohai roles/staging.rb --node-yaml=nodes/staging.yml
 INFO : Starting Itamae...
root@192.168.33.10's password: 
```

password => vagrant

6. Access with Web browser

Main: http://192.168.33.10
Monitoring: http://192.168.33.10:8282


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


