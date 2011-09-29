class Emailer < ActionMailer::Base
  def contact_email(contact)
         setup_email(contact)
         @subject    += ""

       end

       protected
         def setup_email(contact)
           @recipients  = "info@stbgroup.in"
           @from        = "#{contact.email}"
           @subject     = "Property Manager - Contact Us: "
           @sent_on     = Time.now
           @content_type = "text/html"
           @body[:contact] = contact

        end
end
