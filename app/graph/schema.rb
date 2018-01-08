Schema = GraphQL::Schema.define do
  query QueryType

  id_from_object lambda { |_object, type_definition, _context|
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, id)
  }

  resolve_type lambda { |_type, object, _context|
    case object
    when Release
      ReleaseType
    when Post
      PostType
    else
      raise("Unexpected object: #{obj}")
    end
  }
end
