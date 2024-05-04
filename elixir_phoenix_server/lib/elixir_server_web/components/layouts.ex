defmodule ElixirServerWeb.Layouts do
  use ElixirServerWeb, :html

  embed_templates "layouts/*"

  def home_url(_assigns) do
    ""
  end

  def render(_name, _assigns) do
    ""
  end
end
