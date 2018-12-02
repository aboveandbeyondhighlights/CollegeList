defmodule CollegeList.CollegeList do
  alias CollegeList.Repo
  alias CollegeList.CollegeList.College

  def list_colleges() do
    Repo.all(College)
  end

  def get_college(id) do
    Repo.get(College, id)
  end

  def college_changeset() do
    %College{}
    |> College.changeset(%{})
  end

  def create_college(attrs) do
    %College{}
    |> College.changeset(attrs)
    |> Repo.insert()
  end
end