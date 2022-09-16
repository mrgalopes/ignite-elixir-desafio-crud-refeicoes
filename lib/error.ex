defmodule Exmeal.Error do
  @keys [:status, :result]

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def meal_not_found_error do
    Exmeal.Error.build(:not_found, "Meal not found")
  end
end
