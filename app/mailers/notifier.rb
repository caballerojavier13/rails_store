class Notifier < ActionMailer::Base
  default from: "The Art Store"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.received.subject
  #
  def received (order)
    @order = order

    mail to: order.email, subject: 'The Art Store Order Confirmation'
      end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.shipped.subject
  #
  def shipped(order)
   @order = order

    mail to: order.email, subject: 'The Art Store Shipment Confirmation'
  end
end
