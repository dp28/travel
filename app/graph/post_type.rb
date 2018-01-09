PostType = GraphQL::ObjectType.define do
  name 'Post'
  description 'Some content describing part of the trip'

  implements GraphQL::Relay::Node.interface

  field :id do
    type !types.ID
    resolve lambda { |post, _, _|
      GraphQL::Schema::UniqueWithinType.encode('Post', post.id)
    }
  end

  field :title, types.String
  field :content, types.String

  field :publishedAt do
    type types.String
    resolve ->(post, _, _) { post.published_at }
  end

  field :writtenAt do
    type types.String
    resolve ->(post, _, _) { post.written_at }
  end
end
