class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :password, :on => :create
    has_many :posts

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: {in: 6..20}, confirmation: true, unless: -> (u) { u.password.blank? }
    validates :password_confirmation, presence: true

end