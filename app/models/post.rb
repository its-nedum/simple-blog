class Post < ApplicationRecord
    # relationship
    has_many :comments

    # set validation rules from our form inputs
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 5}
end
