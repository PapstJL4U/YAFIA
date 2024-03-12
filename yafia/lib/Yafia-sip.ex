defmodule Sip do
  alias Yafia
  alias GuiltyGearXrd
  alias StreetFighter

  def main(args) do
    [game | combo] = args
    c = Enum.at(combo, 0)
    IO.puts("Decoding...")
    IO.puts("Game: " <> game)
    IO.puts("Combo: " <> c)
    g = getGame(game)
    Yafia.create_im(c, g)
    Yafia.combine_im()
  end

  def getGame(game) do
    case game do
      "gg" -> GuiltyGearXrd.inputs()
      "sf" -> StreetFighter.inputs()
      _ -> System.stop(1)
    end
  end
end

Sip.call()
