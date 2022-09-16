defmodule Exmeal.Meals.Get do
  alias Exmeal.{Meal, Repo}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end

  defp meal_not_found_error do
    Exmeal.Error.build(:not_found, "Meal not found")
  end
end
