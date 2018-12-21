defmodule Aoc12 do
  def processNums() do
    accMap = %{}
    acc = 0
    index = 0
    numsList =
      File.read!("input.txt")
      |> String.split("\n")

    processNum(index, numsList, acc, accMap)
    |> IO.inspect
  end

  def processNum(index, numsList, acc, accMap) do
    len    = length(numsList)
    index  = rem(index, len)
    number = Enum.at(numsList, index)

    case String.at(number, 0) do
      s when s in ["+", "-"] ->
        acc = 
          Integer.parse(number)
          |> elem(0)
          |> Kernel.+(acc)

        if !accMap[acc] do
          Map.put_new(accMap, acc, 1)
          processNum(index + 1, numsList, acc, accMap)
        else
          acc
        end
      _ -> 
        processNum(index, numsList, acc, accMap)
    end
  end
end
