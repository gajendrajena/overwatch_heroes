json.heros do
  json.array! @heros, partial: 'hero', as: :hero
end

per_page = @heros.per_page
# total_entries = @heroes.total_entries
# offset = @heros.offset

json.pagination do
  json.per_page per_page
  json.total_entries 25
  json.offset 1

  # json.per_page @heros.per_page
  #   json.total_entries @heroes.total_entries
  #   json.offset @heros.offset
end
