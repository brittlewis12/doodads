class User < ActiveRecord::Base
  validates :first_name, :last_name, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

  has_many :follows
  has_many :followed_apps, through: :follows, source: :app

  has_many :doodads
  has_many :doodaded_apps, through: :doodads, source: :app

  acts_as_voter
  # The following optional line tracks karma (up votes) for doodads a user has submitted.
  # Each dooda has a submitter_id column that tracks the user who submitted it.
  # The option :weight value will be multiplied to any karma from that voteable model (defaults to 1).
  # Karma by default is only calculated from upvotes. If you pass an array to the weight option, you can count downvotes as well (below, downvotes count for half as much karma against you):
  # has_karma :questions, :as => :submitter, :weight => [ 1, 0.5 ]
end