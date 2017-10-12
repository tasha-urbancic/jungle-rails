class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  
  def order_email(order, current_user)
    @order = order
    @current_user = current_user
    mail(to: @order.email, subject: "Order #: #{@order.id}" )
  end

end
