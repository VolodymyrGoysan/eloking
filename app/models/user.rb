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
end
