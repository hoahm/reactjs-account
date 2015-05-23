##
# RecordsController
#
class RecordsController < ApplicationController
  include ExtInheritedResources
  respond_to :html, :json

  def update
    update! do |success, failure|
      success.json { render json: resource }
      failure.json { render json: resource.errors, status: :unprocessable_entity }
      success.html { redirect_to collection_path }
      failure.html { redirect_to resource_path(resource) }
    end
  end

  private

  def collection
    @collection = resource_class.page(params[:page]).per(params[:per])
  end

  def build_resource_params
    [params.fetch(:record, {}).permit(:title, :amount, :date)]
  end
end
