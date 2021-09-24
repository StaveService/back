# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://stave-back.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
    add albums_path, :priority => 0.7, :changefreq => 'daily'
    add artists_path, :priority => 0.7, :changefreq => 'daily'
    add bands_path, :priority => 0.7, :changefreq => 'daily'
    add musics_path, :priority => 0.7, :changefreq => 'daily'
    add users_path, :priority => 0.7, :changefreq => 'daily'

    Album.find_each do |album|
      add album_path(album), :lastmod => album.updated_at
    end
    Artist.find_each do |artist|
      add artist_path(artist), :lastmod => artist.updated_at
    end
    Band.find_each do |band|
      add band_path(band), :lastmod => band.updated_at
    end
    Music.find_each do |music|
      add music_path(music), :lastmod => music.updated_at
    end
    User.find_each do |user|
      add user_path(user), :lastmod => user.updated_at
    end
end
