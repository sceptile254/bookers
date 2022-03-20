class Book < ApplicationRecord
  # バリデーションを設定
  validates :title, presence: true
  validates :body, presence: true
end
