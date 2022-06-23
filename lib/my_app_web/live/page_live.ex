defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <%= "{foo: 1, bar: 4, baz: 2, qux: 3}"
    |> Chartkick.bar_chart()
    |> Phoenix.HTML.raw() %>
    """
  end
end
