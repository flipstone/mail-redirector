class MailRedirector < Struct.new(:destination)
  def delivering_email(m)
    m['X-Originally-To'] = m.to.to_s
    m.to = destination
  end

  def self.setup_interceptor(email_to_redirect_to)
    unless Rails.env.production? || Rails.env.test?
      ActionMailer::Base.register_interceptor(
        MailRedirector.new(email_to_redirect_to)
      )
    end
  end
end

