defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields [:description, :date, :calories]

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
  end
end
