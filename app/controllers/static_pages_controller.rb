class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def question_sent
  	UserMailer.new_question(question_params).deliver_now
    redirect_to :back
    flash[:notice] = 'Your order has succsessfully sent'
  end

  private
  def question_params
    params.require(:question).permit(:subject, :my_email, :message)
  end

end
