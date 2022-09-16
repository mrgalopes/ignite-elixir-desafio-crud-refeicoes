defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.meal_not_found_error()}
      meal -> update_meal(meal, params)
    end
  end

  defp update_meal(meal, params) do
    Meal.changeset(meal, params)
    |> Repo.update()
  end
end
