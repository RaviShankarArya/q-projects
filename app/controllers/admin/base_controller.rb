class Admin::BaseController < ApplicationController
  layout 'poodle/application'
  before_filter :require_admin, :set_navs, :parse_pagination_params
end
