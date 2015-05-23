##
# RecordsController
#
class RecordsController < ApplicationController
  include ExtInheritedResources
  respond_to :html, :json

  private

  def collection
    @collection = resource_class.page(params[:page]).per(params[:per])
  end

  def build_resource_params
    [params.fetch(:record, {}).permit(:title, :amount, :date)]
  end
end
