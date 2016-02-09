class DemoMailer < ApplicationMailer
  default from: "request@cannabam.com"
  layout false

  def notify(email, name, contact, company_name)
    @email, @name, @contact, @company_name = email, name, contact, company_name
    mail(to: "hello@canabam.com", subject: "Someone requested for a demo!")
  end

end
