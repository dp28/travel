class AppsController < ApplicationController

  def current; end

  def version
    @release = ReleaseRepository.find_by_version(params[:version])
    @release || raise_not_found
  end

private

  def raise_not_found
    raise ActionController::RoutingError, 'Not Found'
  end

end
