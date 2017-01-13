class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :user, presence: true
  validates_uniqueness_of :url, scope: :user_id, :message=>"URL already exists."
end
