module AnalyticsHelper
  def render_analytics
    render 'shared/google_analitics' if Rails.env.production?
    render 'shared/yandex_metrika' if Rails.env.production?
  end
end
