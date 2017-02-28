class Registerdapp < ActiveRecord::Base
	belongs_to :user
	validates :title,
			  uniqueness: { case_sensitive: false }
	validates :body, :format => URI::regexp(%w(http https))
end
