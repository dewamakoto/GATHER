json.array! @bars do |bar|
  json.id bar.id
  json.title bar.title
  json.image bar.image_url
  json.detail bar.detail
end