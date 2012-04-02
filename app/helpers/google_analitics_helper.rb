module GoogleAnaliticsHelper
  def render_google_analitics
    render 'shared/google_analitics' if Rails.env.production?
  end
end
