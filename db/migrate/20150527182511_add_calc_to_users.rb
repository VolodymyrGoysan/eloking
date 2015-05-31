class AddCalcToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_division, :integer
    add_column :users, :desired_division, :integer
    add_column :users, :current_league, :integer
    add_column :users, :desired_league, :integer
    add_column :users, :lp_per_win, :integer
    add_column :users, :price, :float
    add_column :users, :server, :string
    add_column :users, :nickname, :string
    add_column :users, :skype, :string
  end
end
