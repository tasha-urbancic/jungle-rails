# Jungle

A mini e-commerce application built with Rails 4.2.


## Getting Started
```
1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
```

## Dependencies
```
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
```

## Screenshots

Home Page:
![“Products”](https://github.com/tasha-urbancic/jungle-rails/blob/master/docs/products.png?raw=true)

Shopping Cart:
![“Cart”](https://github.com/tasha-urbancic/jungle-rails/blob/master/docs/cart.png?raw=true)

Product Reviews:
![“Reviews”](https://github.com/tasha-urbancic/jungle-rails/blob/master/docs/reviews.png?raw=true)
