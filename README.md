# unjava Cookbook

The default recipe of this cookbook will monkey patch your run list to prevent the installation of openjdk 6 due to a recipe earlier in the run list including recipe `java::default`. The community java cookbook is awesome! The assumption that you want the default recipe included in your run list is not!

[![Build Status](https://travis-ci.org/dschlenk/unjava.svg?branch=master)](https://travis-ci.org/dschlenk/unjava)

Requirements
------------

- Chef 12 or higher
- Ruby 2.0 or higher
- A supported platform / version:
  - CentOS/RHEL 5, 6, 7
  - Debian 6, 7
  - Ubuntu 12.04, 14.04
  - FreeBSD 9.3, 10.1

Attributes
----------
- `node[:unjava][:package_action]` - Used by the default recipe as the action to take to suppress installation of openjdk packages. Defaults to `:nothing`.
- `node[:unjava][:undo_action]` - Used by the `rejava` recipe as the action to take to reverse suppression action taken in the default recipe. Defaults to `:install`. 
- `node[:unjava][:resources]` - List of resources that are removed from the run list in the default recipe. See `attributes/default.rb` for defaults.

Recipes
-------
- `default` - includes the `unjava` recipe.
- `unjava` - Prevents the installation of openjdk packages. Removes other resources from the run list.
- `rejava` - Changes the action of the packages suppressed in `unjava` to `node[:unjava][:undo_action]` and then includes recipe `java::default`, causing java to get installed. Because perhaps you just want java installed in a different order than whatever another recipe in your run list wants. 

Development
-----------

1. Fork, then clone your repository from GitHub.

2. Create a git branch

        $ git checkout -b my_bug_fix

3. Install dependencies:

        $ bundle install

4. Make your changes/patches/fixes, committing appropiately
5. **Write tests**
6. Run the tests:
    - `bundle exec foodcritic -f any .`
    - `bundle exec rspec`
    - `bundle exec rubocop`
    - `bundle exec kitchen test`

  In detail:
    - Foodcritic will catch any Chef-specific style errors
    - RSpec will run the unit tests
    - Rubocop will check for Ruby-specific style errors
    - Test Kitchen will run and converge the recipes


License & Authors
-----------------
- Author:: David Schlenk (<dschlenk@converge-one.com>)

```text
Copyright:: 2015, Spanlink Communications, Inc dba ConvergeOne Collaboration

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
