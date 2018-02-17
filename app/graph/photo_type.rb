PhotoType = GraphQL::ObjectType.define do
  name 'Photo'
  description 'A photo taken on a specific day of the trip'

  field :url, !types.String
  field :caption, types.String
  field :day, !DayType
  field :width, !types.Int
  field :height, !types.Int

  field :isFavourite do
    type !types.Boolean
    resolve ->(photo, _, _) { photo.favourite? }
  end

  field :aspectRatio do
    type !types.Float
    resolve ->(photo, _, _) { photo.aspect_ratio }
  end
end
