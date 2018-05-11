class AppsController < ApplicationController

  def current; end

  def version
    @release = ReleaseRepository.find_by_version(params[:version])
    @release || raise_not_found
  end

  def history
    @json_releases = present_releases ReleaseRepository.search
  end

private

  def raise_not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def present_releases(releases)
    releases.reverse.map.with_index do |release, index|
      {
        version: release.version,
        time: release.time.to_s[0..15],
        number: index + 1,
        description: render_markdown(release.description)
      }
    end.to_json
  end

  def render_markdown(markdown)
    markdown_engine.render markdown
  end

  def markdown_engine
    @markdown_engine ||= begin
      renderer = Redcarpet::Render::HTML.new
      Redcarpet::Markdown.new renderer
    end
  end

end
