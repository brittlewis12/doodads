class Doodad < ActiveRecord::Base
  belongs_to :app
  belongs_to :user

  acts_as_votable
end