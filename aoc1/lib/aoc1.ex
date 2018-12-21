defmodule Aoc1 do
  def processNums() do
    acc = 0
    output =
      File.read!("input.txt")
      |> String.split("\n")
      |> Enum.reduce(acc, &processNum/2)
      |> IO.inspect
  end

  defp processNum(number, acc) do
    String.at(number, 0)
    |> case do
      s when s in ["+", "-"] ->
        Integer.parse(number)
        |> elem(0)
        |> Kernel.+(acc)
      _ -> acc
    end
  end
end
