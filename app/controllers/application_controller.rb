# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_default_meta_tags

  protected

  def set_default_meta_tags
    set_meta_tags :site => 'Инна Глушкова. Фотограф', 
                  :keywords => 'инна глушкова, фотограф, детское фото, семейное фото, freezelight, севастополь',
                  :description => 'Инна Глушкова - фотограф из Севастополя. Детское, семейное, свадебное фото. Freezelight.'
  end
end
