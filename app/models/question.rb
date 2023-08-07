class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3, maximum: 40}
  validates :body, presence: true, length: { minimum: 3, maximum: 1000}
  paginates_per 20


  def format_created_at
    self.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
