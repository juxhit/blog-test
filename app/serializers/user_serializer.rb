class UserSerializer < ActiveModel::Serializer
  attributes :nickname, :email, :count_posts, :count_comments

  def count_posts
    # object.posts.where(date: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day).count
    object.posts.all.count
  end

  def count_comments
    # object.comments.where(date: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day).count
    object.comments.all.count
  end
end
