class ListsPresenter < AppPresenter
  takes :items_presenter

  def as_json(list)
    return {} unless list
    {
      id: list.id,
      name: list.name,
      bought_items: items_presenter.as_json_array(list.bought_items),
      items_to_buy: items_presenter.as_json_array(list.items_to_buy),
    }
  end
end
