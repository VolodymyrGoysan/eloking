class UserMailer < ApplicationMailer
	default from: 'elo-king.delivery@gmail.com'
 
  def new_order(user)
  	@user = user
  	@order_id = user.id
  	mail(to: 'naytlender@gmail.com', subject: "New order, id: #{@order_id}")
  end

  def new_question(question)
  	@question = question
  	mail(to: 'naytlender@gmail.com', subject: "#{@question[:subject]}")
  end
end
