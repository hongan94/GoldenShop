class Product < ActiveRecord::Base

	mount_uploader :image, ImageProductUploader
end