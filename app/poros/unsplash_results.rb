class UnsplashResults
  def get_url(params)
   return nil if params.nil? || params == ""
   results = BackgroundService.new.get_url(params)
   Background.new(results)
  end
end
