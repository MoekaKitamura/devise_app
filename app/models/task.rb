class Task < ApplicationRecord
  enum status: { 重要！: 1, できれば: 2, あとで: 3 }
end
