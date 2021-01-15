class User < ActiveRecord::Base
    has_many :pizza_parlours

    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_secure_password
end
