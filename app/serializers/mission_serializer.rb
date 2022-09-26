class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name, :scientist_id, :planet_id
end
