class UserSerializer < ActiveModel::Serializer
  attributes :nickname, :email, :count_posts, :count_comments

  def count_posts
    object.posts.all.where(start_date > published_at).count
  end

  def count_comments
    object.comments.all.count
  end
end
