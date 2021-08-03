# BACK

[ER](https://drive.google.com/file/d/1KcrZQ3ejE4QzUY7tAJzDBRrklgK9Sui4/view?usp=sharing)

## Functions

- 会員登録
- ログイン
- ログアウト
- お気に入り
- フォロー
- 検索
- ページネーション
- 通知機能
- 楽譜閲覧
- 楽譜再生
- 楽譜投稿
- 楽譜イシュー投稿
- 楽譜リクエスト投稿
- Gitサーバー
- Spotify API
- iTunes API
- Wiki API

## Gems

- [devise_token_auth](https://devise-token-auth.gitbook.io/devise-token-auth/)
- [ransack](https://github.com/activerecord-hackery/ransack)
- [kaminari](https://github.com/kaminari/kaminari)
- [graphql](https://github.com/rmosolgo/graphql-ruby)
- [graphiql-rails](https://github.com/rmosolgo/graphiql-rails)
- [graphql-batch](https://github.com/Shopify/graphql-batch)
- [olive_branch](https://github.com/vigetlabs/olive_branch)
- [rugged](https://github.com/libgit2/rugged)
- [carrierwave](https://github.com/carrierwaveuploader/carrierwaves)
- [unicorn](https://github.com/defunkt/unicorn)
- [noticed](https://github.com/excid3/noticed)
- [mobility](https://github.com/shioyama/mobility)
- [mobility-ransack](https://github.com/shioyama/mobility-ransack)

## Docker Container

- [docker-nginx-git](https://github.com/marcopompili/docker-nginx-git)

## Heroku

```sh
heroku pg:reset DATABASE --confirm stave-back
heroku run rails db:migrate
heroku run rails db:seed
```

## Credentials

```sh
docker-compose run app rails credentials:edit
```

- linux

```sh
heroku config:set RAILS_MASTER_KEY=`cat config/master.key`
```

- windows

```sh
heroku config:set RAILS_MASTER_KEY=`type config/master.key`
```

## graphql-rails

```sh
rails g graphql:object Post title:String rating:Int comments:[Comment]
```

## Testing

test-user

- test@test.com
- password

references

- [rspec-rails-examples](https://github.com/eliotsykes/rspec-rails-examples)
- [http status code for rails](https://kapeli.com/cheat_sheets/HTTP_Status_Codes_Rails.docset/Contents/Resources/Documents/index)

gems

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [rspec-request_describer](https://github.com/r7kamura/rspec-request_describer)
- [factory_bot](https://github.com/thoughtbot/factory_bot)
- [faker](https://github.com/faker-ruby/faker)
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

```sh
docker-compose run app bundle exec rspec

docker-compose run app bundle exec rspec spec/models

docker-compose run app bundle exec rspec spec/controllers/accounts_controller_spec.rb

docker-compose run app bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```

## Lint

```sh
docker-compose run app rubocop -a
```
