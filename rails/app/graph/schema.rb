module Nodes

  def self.get_model_class_for_type_name(type_name)
    node_class = {
      Day: Day,
      Release: Release,
      Post: Post
    }[type_name.to_sym]
    node_class || raise("Unknown Node type '#{type_name}'")
  end

  def self.get_graphql_class_for_model_class(model_class)
    graphql_class = {
      Day => DayType,
      Release => ReleaseType,
      Post => PostType
    }[model_class]
    graphql_class || raise("Unknown Model class '#{model_class}'")
  end

end

Schema = GraphQL::Schema.define do
  query QueryType

  id_from_object lambda { |_object, type_definition, _context|
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, id)
  }

  object_from_id lambda { |id, _context|
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    model_class = Nodes.get_model_class_for_type_name type_name
    model_class.find_by id: item_id
  }

  resolve_type lambda { |_type, object, _context|
    Nodes.get_graphql_class_for_model_class(object.class)
  }
end
