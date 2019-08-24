class Book < ApplicationRecord
   validates:body, presence:true, length: { maximum: 200 }
     belongs_to :user
end
