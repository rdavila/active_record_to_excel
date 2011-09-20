# active_record_to_excel

active_record_to_excel is a litle tool for generate simple MS Excel 
reports based on the results returned from your ActiveRecord queries.

## Usage

### In your Gemfile:

    gem 'active_record_to_excel'
    
### Generating reports:

```ruby
User.all.to_excel({ :name => 'Name', :email => 'Email' })
```

That line of code creates a report.xls file under the public folder of your rails app.

The keys on the hash are methods of you ActiveRecord object that returns the value required, the values 
are the labels of the columns on the Excel sheet.

You can pass optionally two arguments: **:filename** and **:path**

```ruby
User.all.to_excel({ :name => 'Name', :email => 'Email', :path => '~/reports', :filename => 'users.xls' })
```

It will create a **users.xls** file in your $HOME/reports directory.

## Copyleft

Copyleft (ɔ) 2011 [Rubén Dávila](http://rubenonrails.com)
