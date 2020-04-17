class Message < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :text, {presence: true, length: {maximum: 300}}

  def self.search(search)
    return Message.all unless search
    Message.where('text LIKE(?)', "%#{search}%")
  end
end
