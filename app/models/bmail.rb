class Bmail < ActiveRecord::Base
	belongs_to :user
  attr_accessible :bcc, :body, :cc, :subject, :to
  validates_presence_of :to
end
