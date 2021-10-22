defmodule HeatTags.Messages.Create do
  alias HeatTags.{Message, Repo}

  def call(params) do
    params
    |> Message.changest()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Message{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
