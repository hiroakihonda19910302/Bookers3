class Book < ApplicationRecord

	belongs_to :user

	# バリデーション追記
	validates :title, presence: true
  	validates :body, presence: true, length: {maximum: 200 }
	
end
