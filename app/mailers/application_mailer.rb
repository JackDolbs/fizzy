class ApplicationMailer < ActionMailer::Base
  # Allow self-hosters to configure the from address via environment variable.
  default from: ENV.fetch("MAIL_FROM", "Fizzy <support@fizzy.do>")

  layout "mailer"
  append_view_path Rails.root.join("app/views/mailers")
  helper AvatarsHelper, HtmlHelper

  private
    def default_url_options
      if Current.account
        super.merge(script_name: Current.account.slug)
      else
        super
      end
    end
end
