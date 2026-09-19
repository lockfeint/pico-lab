function contains(tbl, str)
  for v in all(tbl) do
    if v == str then
      return true
    end
  end
  return false
end
