# Sample App developed using RoR

Implements web components for experimenting with UI test framework and tools.

## Mac OS Installation (for master and development branch)

(1) Install Postgres database
```sh
$ brew install postgres
```

(2) Start Postgres
```sh
$ pg_ctl -D /usr/local/var/postgres -l logfile start
```

## Windows Installation (for window branch)

(1) Use [RailsInstaller](http://railsinstaller.org/en)

(2) Follow [Paperclip](https://github.com/thoughtbot/paperclip) to install ImageMagick and file

(3) In command prompt, run
```sh
$ gem install rails
$ gem install bundler
```

## Starting the server

```sh
$ rails db:migrate:reset
$ rails db:seed
$ rails s
```
