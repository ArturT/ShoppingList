class ItemsPresenter < AppPresenter
  def as_json(item)
    return {} unless item
    {
      id: item.id,
      name: item.name,
    }
  end
end
