defmodule CollegeListWeb.CollegeController do
  use CollegeListWeb, :controller
  alias CollegeList.CollegeList
  alias CollegeList.College

  def index(conn, _params) do
    render conn, "index.html", colleges: CollegeList.list_colleges()
  end

  def show(conn, %{"id" => college_id}) do
    render conn, "show.html", college: CollegeList.get_college(college_id)
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: CollegeList.college_changeset()
  end

  def create(conn, %{"college" => college_params}) do
    CollegeList.create_college(college_params)
    |> case do
      {:ok, college} ->
        conn
        |> put_flash(:info, "College created successfully.")
        |> redirect(to: Routes.college_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end