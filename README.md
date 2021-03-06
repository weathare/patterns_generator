# PatternsGenerator
Ruby on Rails (with RSpec) custom generators.  
[![Build Status](https://travis-ci.org/weathare/patterns_generator.svg?branch=master)](https://travis-ci.org/weathare/patterns_generator)

## Usage
### app/parameters
```
$ raiils generate parameter api/resources/register
    create  app/parameters/api/resources/register_parameter.rb
    create  spec/parameters/api/resources/register_parameter_spec.rb
    insert  app/controllers/application_controller.rb
```

### app/controllers/concerns
```
$ rails generate concern:controller tokens/decodable
      create  app/controllers/concerns/tokens/decodable.rb
      create  spec/controllers/concerns/tokens/decodable_spec.rb
```

### app/models/concerns
```
$ rails generate concern:model tokens/generatable
      create  app/models/concerns/tokens/generatable.rb
      create  spec/models/concerns/tokens/generatable_spec.rb
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'patterns_generator'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install patterns_generator
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
