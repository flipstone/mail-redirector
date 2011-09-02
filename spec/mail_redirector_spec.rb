require 'spec_helper'

describe MailRedirector do
  describe "delivering_email" do
    it "sets the to" do
      m = Mail.new to: "bar@example.com"

      MailRedirector.new('test@example.com').delivering_email m
      m.to.should == ['test@example.com']
    end

    it "sets a header with the original to" do
      m = Mail.new to: "bar@example.com"
      MailRedirector.new.delivering_email m
      m['X-Originally-To'].to_s.should =~ /bar@example\.com/
    end
  end
end
