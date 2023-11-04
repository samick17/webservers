defmodule ElixirServerWeb.APIController do
  use ElixirServerWeb, :controller

  def test(conn, _params) do
    conn
    |> json(%{})
  end
end
