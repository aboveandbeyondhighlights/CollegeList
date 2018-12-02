defmodule CollegeListWeb.PageController do
  use CollegeListWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
