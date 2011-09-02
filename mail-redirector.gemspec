# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mail-redirector/version"

Gem::Specification.new do |s|
  s.name        = "mail-redirector"
  s.version     = MailRedirector::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Vollbracht"]
  s.email       = ["david@finario.com"]
  s.homepage    = "http://github.com/flipstone/mail-redirector"
  s.summary     = %q{Simple Rails 3 mail interceptor to redirect action mailer messages to a test address.}
  s.description = <<-end_desc
Protect yourself for ever accidentally sendmail emails from an environment other than production. MailRedirector
lets you specify an email address to redirect all mail send by ActionMailer to.  It also sets the X-Originally-To
header to the original recipients, ensuring you can inspect to message and verify it would have gone to the correct
recipients.
  end_desc

  s.add_dependency 'actionmailer', '>= 3.0.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
