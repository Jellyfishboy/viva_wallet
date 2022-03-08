## Viva Wallet

[![Gem Version](https://badge.fury.io/rb/viva_wallet.svg)](https://badge.fury.io/rb/viva_wallet)

A Ruby wrapper for the Viva Wallet Smart Checkout API.

## Installation

Add module to your Gemfile:

```ruby
gem 'viva_wallet'
```

Then run bundle to install the Gem:

```sh
bundle install
```

Set up an initializer file with your Viva Wallet Smart Checkout client keys:

```ruby
VivaWallet.client_id  = 'viva_client_id'
VivaWallet.client_secret = 'v1'
VivaWallet.test_mode  = "true or false"
```
e.g. *config/initializers/viva_wallet.rb*

## Usage

This gem provides a collection of operations for use within the Viva Wallet Smarket Checkout API.

### Generate API access token

Use OAuth to generate new API access for an account

```ruby
VivaWallet::Authentication.oauth
````

### Payments

Create a Payment Order

```ruby
VivaWallet::Payment.create(payment_order_params)
````

## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2022 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=viva_wallet&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))  
Licenced under the MIT licence.
