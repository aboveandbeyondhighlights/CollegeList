defmodule CollegeList.CollegeList.College do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colleges" do
    field :city, :string
    field :conference, :string
    field :name, :string
    field :nickname, :string
    field :state, :string
    field :type, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(college, attrs) do
    college
    |> cast(attrs, [:name, :city, :state, :type, :nickname, :conference, :website])
    |> validate_required([:name, :city, :state, :type, :nickname, :conference, :website])
  end
end
