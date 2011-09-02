Mail Redirector
===============

Installation
------------

### In Your Gem File

> gem 'mail-redirector

### In config/initializers/mail-redirector.rb

> MailRedirector.setup_interceptor 'test@example.com'

That's it!


What it's doing
---------------

In all environments other than PRODUCTION or TEST, mail sent through
ActionMailer will be redirected to test@example.com. No mail will be
sent to its original destination. Instead, the X-Originally-To mail
header will be set, allowing you to determine who the mail would have
gone to had it not been redirected.

Mail in the TEST environment is specifically NOT redirected on the
assumption that it is more convenient to configure action mailer
to test delivery mode and still allow the tests to have access to
the original to field for testing purposes.


I want more control!
--------------------

If you want to change what addresses mail is redirected to in each
environment, then INSTEAD of calling setup_interceptor, place
a line of code like this:

> ActionMailer::Base.register_interceptor(MailRedirector.new("test@example.com"))

In each environment file, or wherever makes sense for you.

Happy Redirecting!
