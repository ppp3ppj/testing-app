defmodule TestingAppWeb.ClientFacingLive do
  use TestingAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Greetings Client!</h1>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
