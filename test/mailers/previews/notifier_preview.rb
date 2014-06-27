# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifier/received
  def received
    Notifier.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier/shipped
  def shipped
    Notifier.shipped
  end

end
