class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates :title, presence: {message: 'Не должно быть пустым!'}
  validates :body, presence: {message: 'Не должно быть пустым!'}

  paginates_per 5

end
