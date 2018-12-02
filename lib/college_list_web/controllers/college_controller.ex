defmodule CollegeListWeb.CollegeController do
  use CollegeListWeb, :controller
  alias CollegeList.CollegeList
  alias CollegeList.College

  def index(conn, _params) do
    render conn, "index.html", colleges: CollegeList.list_colleges()
  end

  def show(conn, %{"id" => id}) do
    render conn, "show.html", college: CollegeList.get_college(id)
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: CollegeList.change_college()
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

  def edit(conn, %{"id" => id}) do
    college = CollegeList.get_college(id)
    changeset = CollegeList.change_college(college)
    render conn, "edit.html", college: college, changeset: changeset
  end

  def update(conn, %{"id" => id,  "college" => college_params}) do
    college = College.get_college(id)

    case CollegeList.update_college(college, college_params) do
      {:ok, college} ->
        conn
        |> put_flash(:info, "College updated successfully")
        |> redirect(to: Routes.college_path(conn, :show, college))
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "edit.html", college: college, changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    college = CollegeList.get_college(id)
    {:ok, _college} = CollegeList.Repo.delete(college)

    conn
    |> put_flash(:info, "College deleted successfully")
    |> redirect(to: Routes.college_path(conn, :index))
  end
end