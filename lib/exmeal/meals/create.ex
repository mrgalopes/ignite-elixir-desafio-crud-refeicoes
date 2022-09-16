defmodule Exmeal.Meals.Create do
  alias Exmeal.Repo

  def call(params) do
    params
    |> Exmeal.Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Exmeal.Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Exmeal.Error.build(:bad_request, result)}
  end
end
