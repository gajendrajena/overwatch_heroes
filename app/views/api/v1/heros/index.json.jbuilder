json.heros do
  json.array! @heros, :id, :name, :slug, :image_portrait, :image_splash, :image_card_background
end

json.pagination do
  json.per_page @heros.per_page
  json.total_entries @heros.total_entries
  json.offset @heros.offset
  json.current_page @heros.current_page
  json.total_pages @heros.total_pages
  json.next_page @heros.previous_page
end
