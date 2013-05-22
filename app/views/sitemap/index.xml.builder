xml.instruct!
xml.urlset(
  'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
  'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1"
) do
  @static_pages.each do |page|
    xml.url do
      xml.loc "#{page}"
      xml.changefreq("monthly")
    end
  end
  @users.each do |user|
    xml.url do
      xml.loc "#{user_url(user)}"
      xml.changefreq("monthly")
    end
  end
  @poems.each do |poem|
    xml.url do
      xml.loc "#{post_url(poem.user, poem)}"
      xml.lastmod poem.updated_at.strftime("%F")
      xml.changefreq("monthly")
      
    end
  end
end