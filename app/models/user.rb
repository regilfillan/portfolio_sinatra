class User < ActiveRecord::Base
    has_secure_password
    has_many :posts

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: (in: 6..20)

end