class Book < ApplicationRecord

	belongs_to :user

	# バリデーション追記
	validates :title, presence: true
  	validates :body, presence: true
	
end
