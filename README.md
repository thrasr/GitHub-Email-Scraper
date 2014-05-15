This is a quick ruby script to get emails of contributors, watchers, stargazers, and forkers of a project.

Developed using ruby 2.1, however should run with similar version of ruby.

Gems required:

[Nokogiri](http://nokogiri.org/)

[Watir Webdriver](http://watirwebdriver.com/)

[Headless](https://github.com/leonid-shevtsov/headless)

Usage:

This script takes any number of projects as command line arguments and will iterate through them to grab all relevant emails.

```ruby
ruby scraper.rb myproject1 myproject2 myproject3 ...
```
