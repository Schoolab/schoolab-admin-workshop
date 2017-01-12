class ApplicationMailer < ActionMailer::Base
  default from: 'pierre@theschoolab.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    body = "<p>Bonjour,</p> <p>Vous avez maintenant accès à l'interface Schoolab pour réserver vos salles de réunion.</p> <p>Vous pouvez y accéder sur <a href=\"http://admin.theschoolab.com\">admin.theschoolab.com</a></p> <p>Vos identifiants sont :<br>Email : <strong>" + @user.email + "</strong> <br>Mot de passe : <strong>123456</strong></p> <p>Merci,<br>L'équipe Schoolab</p>"
    mail(to: @user.email,
      content_type: "text/html",
      subject: "Bienvenue sur l'admin Schoolab",
      body: body)
  end
end
