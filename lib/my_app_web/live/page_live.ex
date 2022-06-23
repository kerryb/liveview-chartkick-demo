defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, show: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <input type="button" phx-click="hide" value="Hide" disabled={not @show} />
    <input type="button" phx-click="show" value="Show" disabled={@show} />
    <%= if @show do %>
      <div id="chart" phx-update="ignore" phx-hook="RenderChart">
        <%= "{foo: 1, bar: 4, baz: 2, qux: 3}"
        |> Chartkick.bar_chart()
        |> Phoenix.HTML.raw() %>
      </div>
    <% end %>
    """
  end

  @impl true
  def handle_event("hide", _params, socket) do
    {:noreply, assign(socket, show: false)}
  end

  def handle_event("show", _params, socket) do
    {:noreply, assign(socket, show: true)}
  end
end
