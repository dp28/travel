module MarkdownRenderer

  def self.render(markdown)
    engine.render markdown
  end

  def self.engine
    @engine ||= begin
      renderer = Redcarpet::Render::HTML.new
      Redcarpet::Markdown.new renderer, strikethrough: true
    end
  end

end

module RosieTagRenderer

  ROSIE_CLASS_NAME = 'Rosie'.freeze

  CUSTOM_TO_HTML = {
    ' <R>' => "<span  class=\"#{ROSIE_CLASS_NAME}\">",
    ' </R>' => '</span>',
    '<R>' => "<div class=\"#{ROSIE_CLASS_NAME}\">",
    '</R>' => '</div>'
  }.freeze

  def self.render(text)
    CUSTOM_TO_HTML.reduce(text) do |accumulator, (custom, html)|
      accumulator.gsub custom, html
    end
  end

end

CONTENT_RENDERERS = [MarkdownRenderer, RosieTagRenderer].freeze

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

  field :content do
    type !types.String
    resolve lambda { |post, _, _|
      CONTENT_RENDERERS.reduce(post.content) { |content, renderer| renderer.render content }
    }
  end

  field :publishedAt do
    type !types.String
    resolve ->(post, _, _) { post.published_at }
  end

  field :writtenAt do
    type !types.String
    resolve ->(post, _, _) { post.written_at }
  end
end
