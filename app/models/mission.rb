class Mission < ApplicationRecord
    belongs_to :scientist
    belongs_to :planet
    validates :name, :scientist_id, :planet_id, presence: true
    
    # looks at mission table for a record for a combo of scientist_id 
    # and planet_id and will prevent creating a matching combo
    validates :scientist_id, uniqueness: {scope: :planet_id}


end
