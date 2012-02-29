require 'progressbar'
require 'factory_girl'
require 'ffaker'
require './spec/support/factories'

class Generate < Thor
  require './config/environment'
  ActionMailer::Base.perform_deliveries = false

  desc "all", "Run all generators. It will destroy all records before invoking generators"
  def all
    [Photo, Album].each &:delete_all
    invoke :albums
    invoke :photos
  end

  desc "photos", "Generates photos"
  method_option :photos, type: :numeric, default: 50
  def photos
    albums = Album.all
    with_progress_bar "photos", options[:photos] do
      Factory :photo, :album => albums.sample
    end
  end

  desc "albums", "Generates albums"
  method_option :albums, type: :numeric, default: 5
  def albums
    with_progress_bar "albums", options[:albums] do
      Factory :album
    end
  end

  private

  def with_progress_bar(title, count, &block)
    raise "no block given" unless block_given?

    pbar = ProgressBar.new title, count
    count.times do
      yield
      pbar.inc
    end
    pbar.finish
  end
end
