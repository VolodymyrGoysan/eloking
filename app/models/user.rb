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

  validates :nickname, presence: true, uniqueness: true
  validates :skype, presence: true

  DIVISIONS = (1..5).to_a.map! { |k| ["Division #{6 - k}", k] }
  LEAGUES = [['Bronze', 0], ['Silver', 1], ['Gold', 2], ['Platinum', 3], ['Dimond', 4], ['Master', 5], ['Chalenger', 6]]
  SERVERS = [['Korea'],['EUW'],['Oceania'],['LAS'],['Russia'],['NA'],['EUNE'],['Brazil'],['LAN'],['Turkey']]
  LP_PER_WIN = [['More then 15',1], ['Less then 15', 1.25]]

  def current_league_name
    LEAGUES.to_h.key(self.current_league)
  end

  def current_division_name
    DIVISIONS.to_h.key(self.current_division)
  end

  def desired_league_name
    LEAGUES.to_h.key(self.desired_league)
  end

  def desired_division_name
    DIVISIONS.to_h.key(self.desired_division)
  end

  def wins
    @wins
  end

  def wins=(wins)
    @wins = wins
  end

end
