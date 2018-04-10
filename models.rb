class User < ActiveRecord::Base
has_many :posts
end

#recipes
class Post < ActiveRecord::Base
belongs_to :user
has_many :classifications, through: :classifications#catagories
end

#catagories
class Classification < ActiveRecord::Base
has_many :posts, through: :posts
end

#joined table
#catagories id
#post id
class ClassificationPost < ActiveRecord::Base
belongs_to :post
belongs_to :classification
end
