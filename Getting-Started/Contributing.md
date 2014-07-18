# Contributing Guidelines

note: If you are using docker and fig, you will have to preface commands such as rake, rails, bundle, etc with `fig compass run <cmd>`

## Check the Issue Queue
Check our [Github issue queue](https://github.com/empirical-org/Compass/issues?state=open) for ideas on how to help.


## Pull Request Guidelines
*the text below is copied from https://github.com/thoughtbot/factory_girl_rails/blob/master/CONTRIBUTING.md.*

We love pull requests. Here's a quick guide:

1. __Fork the repo.__

   If you followed the instructions in the 
   [Install Guide](/Getting-Started/Install/Install%20Guide.md)
   you will probably want to modify the submodules to point to your new fork(s).

2. __Run the tests.__ 

   We only take pull requests with passing tests, and it's great
   to know that you have a clean slate: `bundle && rake`

3. __Add a test for your change.__

   Only refactoring and documentation changes
   require no new tests. If you are adding functionality or fixing a bug, we need
   a test!
   
   The only exception to this would be some frontend changes. Since we don't currently
   use a javascript testing framework or an acceptance testing framework, some frontend 
   changes may not require any tests (please err on the side of testing, though).

4. __Make the test pass.__

5. __Push to your fork and submit a pull request.__


At this point you're waiting on us. We like to at least comment on, if not accept, pull requests within three business days (and, typically, one business day). Quinn and Josh will review pull requests and provide feedback on code quality. We may suggest some changes or improvements or alternatives. Large commits will be reviewed in a pair programming session.

## Ruby Code Guidelines

**Project Guidelines**
* Use SLIM rather than HAML. 
* Write JavaScript, not CoffeeScript.
* Always write tests (the test suite is really bare right now) and nothing is to be merged without tests.
* Make pull requests on the Master branch. 
* Use a minimalist approach to using gems like devise, FactoryGirl, etc, unless they're absolutely needed.

**Ruby Guidelines**
* Make sure your code follows [Ruby](https://github.com/styleguide/ruby) and project conventions.
* Make sure you don't have any IDE / platform specific files committed. i.e.
    `.DS_Store`, `.idea`, `.project` (consider adding these to a [global gitignore](https://help.github.com/articles/ignoring-files#global-gitignore)).
* Before commiting, run `rake`, make sure all tests pass.
* Use Rails idioms and helpers
* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides, whatever is affected by your contribution

**Syntax:**
* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer &&/|| over and/or.
* MyClass.my_method(my_arg) not my_method( my_arg ) or my_method my_arg.
* a = b and not a=b.
* Follow the conventions you see used in the source already.



## Commit Message Guidelines

[Follow these best practices from Git.](http://git-scm.com/book/ch5-2.html#Commit-Guidelines)


## Testing guidelines

All new features should have some form of integration testing. If any of the units are complex enough to merit it a unit test can be written for them as well (but not necessary). No acceptance testing framework is currently being used.

## Testing on Staging

The code reviewer will deploy each test to staging, and the feature will be tested on staging before being released. 


## Code Deployement

Deploy production and staging:

~~~ sh
git remote add heroku-production git@github.com:empirical-grammar.git
git remote add heroku-staging    git@github.com:empirical-grammar-staging.git

## production:
git push heroku-production REF:master

## staging:
git push heroku-staging REF:master
~~~

This command deploys the given ref (replace `REF` with `master`, `branch-name`, etc) to the specified environment.


## Provisioning 

Servers are manually provisioned at this time.

