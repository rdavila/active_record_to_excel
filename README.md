# active_record_to_excel

active_record_to_excel is a litle tool for generate quick and dirty 
reports based on the results returned from your ActiveRecord queries.

## Usage

### In your Gemfile:

    gem 'active_record_to_excel'
    
### Generating reports:

You can select a single value...

```ruby
User.all.to_excel({ :name => 'Name', :email => 'Email' })
```

That line of code creates a report.xls on the public folder of your rails app with the report.

You can pass optionally two arguments: **:filename** and **:path**

```ruby
User.all.to_excel({ :name => 'Name', :email => 'Email', :path => '~/reports', :filename => 'users.xls' })
```

It will create a **users.xls** file in your $HOME/reports directory.

## Copyright

Copyright &copy; 2011 [Rubén Dávila](http://rubenonrails.com)

