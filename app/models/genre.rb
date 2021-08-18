class Genre < ApplicationRecord
  
  enum valid_invalid_status: { 有効: 0, 無効: 1}
end
