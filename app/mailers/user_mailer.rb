class UserMailer < ApplicationMailer
  default from: 'kjvenky@gmail.com'
 
  def welcome_email
  	@order = Order.last
    mail(to: 'kjvenky@gmail.com', cc: 'rahuly1287@gmail.com', subject: 'New Order on Hathi').deliver
  end

  # Send order success email to customer. We are not taking his email id
  def order_email(order)
  	@order = order
  	mail(to: 'kjvenky@gmail.com', cc: 'rahuly1287@gmail.com', subject: 'New Order on Hathi').deliver
  end
end
