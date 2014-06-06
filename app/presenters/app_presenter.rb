class AppPresenter
  def as_json_array(collection)
    collection.map { |p| as_json(p) }
  end
end
