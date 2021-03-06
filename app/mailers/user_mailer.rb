class UserMailer < ApplicationMailer

  default from: 'gohathi@gmail.com'
 
  def welcome_email
  	@order = Order.last

    mail(to: @order.email, subject: 'Your Order Details on GoHathi').deliver
  end

  # Send order success email to customer. We are not taking his email id
  def order_email(order)
  	@order = order

  	mail(to: @order.email, subject: 'Your Order Details on GoHathi').deliver


  end
end
