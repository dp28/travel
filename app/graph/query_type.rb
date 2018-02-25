QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :node, GraphQL::Relay::Node.field

  connection :releases, ReleaseType.connection_type do
    description 'All Releases of the site so far'

    resolve lambda { |_object, _args, _context|
      ReleaseRepository.search
    }
  end

  connection :posts, PostType.connection_type do
    description 'All content of the site so far'

    resolve lambda { |_object, _args, _context|
      PostRepository.new.search
    }
  end

  connection :photos, PhotoType.connection_type do
    description 'All photographs of the trip so far'
    argument :isFavourite, types.Boolean

    resolve lambda { |_object, args, _context|
      if args.key?(:isFavourite)
        args[:isFavourite] ? Photo.where(favourite: true) : Photo.where(favourite: false)
      else
        Photo.all
      end
    }
  end

  connection :days, DayType.connection_type do
    description 'All days of the trip so far'

    resolve lambda { |_object, _args, _context|
      Day.order(:number)
    }
  end

  connection :countries, CountryType.connection_type do
    description 'All countries visited during the trip'

    resolve lambda { |_object, _args, _context|
      Country.all
    }
  end

  connection :areas, AreaType.connection_type do
    description 'All areas within countries visited during the trip'

    resolve lambda { |_object, _args, _context|
      Area.all
    }
  end

  connection :locations, LocationType.connection_type do
    description 'All locations visited during the trip'

    resolve lambda { |_object, _args, _context|
      Location.all
    }
  end

  field :totalExpense do
    type TotalExpenseType
    argument :days, types.Int.to_list_type, default_value: nil
    argument :categories, types.String.to_list_type, default_value: nil

    resolve lambda { |_object, args, _context|
      TotalExpense.calculate(days: args[:days], categories: args[:categories])
    }
  end

  field :day do
    type DayType
    argument :number, types.Int

    resolve lambda { |_object, args, _context|
      Day.find_by(number: args[:number])
    }
  end
end
