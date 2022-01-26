class Favorite < ApplicationRecord
  #1:Nの関係
  belongs_to :user
  belongs_to :book

  #「１ユーザー」「１記事」に対して「１いいね」
  validates_uniqueness_of :book_id, scope: :user_id
end
