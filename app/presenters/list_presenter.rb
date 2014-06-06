class ListPresenter < AppPresenter
  def as_json(list)
    return {} unless list
    {
      id: list.id,
      name: list.name,
      bought_items: {},
      items_to_buy: {}
    }
  end

  def list_items(list_items)
  end
end
