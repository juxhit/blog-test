class User < ApplicationRecord
  has_many :posts, foreign_key: :author
  has_many :comments, foreign_key: :author

  has_secure_password

  validates :nickname, presence: {message: 'Заполни поле!'}
  validates :email, presence: {message: 'Заполни поле!'}, uniqueness: {message: 'Уже есть!'}
  validates :password, presence: {message: 'Не должно быть пустым!'}
  validates :password_confirmation, presence: {message: 'Не совпадает!'}

  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"


  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_region => 'eu-west-1',
                    :url => ':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/assets/missing.png"

  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/png"] }, size: { less_than: 3.megabytes }

  def s3_credentials
    {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
  end

end
