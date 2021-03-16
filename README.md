# BACK

[ER](https://drive.google.com/file/d/1KcrZQ3ejE4QzUY7tAJzDBRrklgK9Sui4/view?usp=sharing)

## Gems

- [devise_token_auth](https://devise-token-auth.gitbook.io/devise-token-auth/)

## Credentials

```cmd
docker-compose run web rails credentials:edit
```

## Testing

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
docker-compose run web bundle exec rspec

docker-compose run web bundle exec rspec spec/models

docker-compose run web bundle exec rspec spec/controllers/accounts_controller_spec.rb

docker-compose run web bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```
