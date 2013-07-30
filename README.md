# at_most

A simple extension to ActiveRecord to allow limiting of model creation via
validation.

## Installation

Add this line to your application's Gemfile:

    gem 'at_most'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install at_most

## Usage

```ruby
# app/models/user.rb

class User < ActiveRecord::Base
  at_most(5)
end

# after fifth User instance
$ User.create!
>> ActiveRecord::RecordInvalid: Validation failed: The maximum number of users has
been reached.
```

It's really that simple.

# Errors

You can specify custom errors in the model, or through i18n:

```ruby
# app/models/user.rb

class User < ActiveRecord::Base
  at_most(5, options: { message: "Sorry, all our spots are full!" })
end
```

There are two i18n options: a **per model** setting, and a *global* setting.

```yaml
en:
  activerecord:
    errors:
      models:
        users:
          at_most: "All of our spots are full :(:("
        books:
          at_most: "I can't read all of these!"
  at_most: "Something went terribly wrong."
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
