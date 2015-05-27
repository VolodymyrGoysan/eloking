class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise  :database_authenticatable,
          # :confirmable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :lockable,
          :validatable,
          :timeoutable

  DIVISIONS = (1..5).to_a.map! { |k| ["Division #{6 - k}", k] }
  LEAGUES = [['Bronze', 0], ['Silver', 1], ['Gold', 2], ['Platinum', 3], ['Dimond', 4], ['Master', 5], ['Chalenger', 6]]
end
