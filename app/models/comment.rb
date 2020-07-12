class Comment < ApplicationRecord
  # relationship
  belongs_to :post
end
