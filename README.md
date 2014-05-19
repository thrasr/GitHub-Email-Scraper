This is a quick ruby script to get emails of contributors, watchers, stargazers, and forkers of all repos for a user/organization.

Developed using ruby 2.1, however should run successfully with similar versions of ruby.

Gems required:

[Github_API](http://peter-murach.github.io/github/)

Usage:

Before beginning, change USERNAME and PASSWORD in login.rb to a set of valid github credentials for authentication.  This allows for 5000 API calls per hour as opposed to the default 60.

This script takes a user or organization as a command line argument and will grab all public emails for users who have interacted with repos of the given user/organization.

```ruby
ruby scraper.rb myorganization
```
