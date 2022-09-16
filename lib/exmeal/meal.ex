defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:description, :date, :calories]

  @required_fields [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:description, :date, :calories]}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
