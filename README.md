# Alphasms

The plugin provides the access to the API functions of the Ukrainian service of SMS-sending Alphasms.ua

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alphasms', git: 'https://github.com/andrad/alphasms-api'
```

And then execute:

    $ bundle

## General configuration

There's a generator that generates the default configuration file into config/initializers directory.
Run the following generator command, then edit the generated file.

```ruby
rails g alphasms:initializer
```

Options:

- `api_key` - your api key
- `sender` - custom sender
- `type` - type of sms (default is :xml, 0 - usual message, 1 - flash message, 2 - wap-push message)

## Usage

To check the balance, use .balance method

```ruby
Alphasms.balance
```

if you want to use another api_key

```ruby
Alphasms.balance({ api_key: 'some key' })
```

you cat also pass a block

```ruby
Alphasms.balance({api_key: 'some key'}) { |b| "#{b.amount} #{b.currency}"} # => "123.98 UAH"
```

To send the sms, use .deliver method

```ruby
Alphasms.deliver({ recipient: '380000000000', message: 'The message' })
```

you can also send several sms

```ruby
Alphasms.deliver([{ recipient: '380000000000', message: 'The message' }, { recipient: '380000000001', message: 'Some text' }])
```

and you can use custom options

```ruby
Alphasms.deliver({ recipient: '380000000000', message: 'The message' }, { api_key: 'some key', sender: 'sender', type: 0 })
```

To check status of sms, use .status method

```ruby
Alphasms.status('id_sms')
```

or

```ruby
Alphasms.status(['id_sms', 'id_sms'])
```

## VERSION

0.0.2 - Gem started

## LICENSE

is licensed under the MIT license.

Copyright (C) 2015 by andrad (Andrey Radzun)