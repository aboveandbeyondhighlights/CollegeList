defmodule CollegeList.Repo.Migrations.CreateColleges do
  use Ecto.Migration

  def change do
    create table(:colleges) do
      add :name, :string
      add :city, :string
      add :state, :string
      add :type, :string
      add :nickname, :string
      add :conference, :string
      add :website, :string

      timestamps()
    end

  end
end
