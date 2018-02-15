PhotoType = GraphQL::ObjectType.define do
  name 'Photo'
  description 'A photo taken on a specific day of the trip'

  field :url, !types.String
  field :caption, types.String
  field :day, !DayType

  field :isFavourite do
    type !types.Boolean
    resolve ->(photo, _, _) { photo.favourite? }
  end
end
