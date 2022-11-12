class SweetsRevue < ApplicationRecord
  belongs_to :end_user
  belongs_to :tag
  belongs_to :favorite
  belongs_to :posuto_comment
  
  
end
