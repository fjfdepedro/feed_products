defmodule Enterprise.Company do
  use Ecto.Schema

  schema "companies" do
    field :name, :string
    field :twitter, :string
    field :categories, :string
  end

  def changeset(company, params \\ %{}) do
    company
    |> Ecto.Changeset.cast(params, ~w(name twitter categories))
    |> Ecto.Changeset.validate_required([:name, :twitter, :categories])
  end
end