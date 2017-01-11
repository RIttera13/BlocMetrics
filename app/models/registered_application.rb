class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates_uniqueness_of :url, :message=>"URL already exists."
end
