class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :body, presence: {message: 'Не должно быть пустым!'}

  scope :created_between, lambda {|start_date, end_date| where("published_at >= ? AND published_at <= ?", start_date, end_date )}
  
end
