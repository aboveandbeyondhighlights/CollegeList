defmodule CollegeList.CollegeList do
  alias CollegeList.Repo
  alias CollegeList.CollegeList.College

  def list_colleges() do
    Repo.all(College)
  end

  def get_college(id) do
    Repo.get(College, id)
  end

  def change_college(%College{} = college) do
    College.changeset(college, %{})
  end

  def create_college(attrs) do
    %College{}
    |> College.changeset(attrs)
    |> Repo.insert()
  end

  def update_college(%College{} = college, attrs) do
    college
    |> College.changeset(attrs)
    |> Repo.update()
  end

  def delete_college(%College{} = college) do
    Repo.delete(college)
  end
end