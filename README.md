# BACK

[ER](https://drive.google.com/file/d/1KcrZQ3ejE4QzUY7tAJzDBRrklgK9Sui4/view?usp=sharing)

## Gems

- [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth)

## Testing

reference

- [rspec-rails-examples](https://github.com/eliotsykes/rspec-rails-examples)

gems

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [factory_bot](https://github.com/thoughtbot/factory_bot)
- [faker](https://github.com/faker-ruby/faker)

```sh
docker-compose run web bundle exec rspec

docker-compose run web bundle exec rspec spec/models

docker-compose run web bundle exec rspec spec/controllers/accounts_controller_spec.rb

docker-compose run web bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```
