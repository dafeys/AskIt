class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true, length: {minimum: 5, maximum: 1000}

  def format_created_at
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
