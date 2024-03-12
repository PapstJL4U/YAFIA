defmodule Sip do
  alias Yafia
  def call do
    [game|combo] = System.argv()
    c = Enum.at(combo,0)
    IO.puts("Decoding...")
    IO.puts("Game: " <>game)
    IO.puts("Combo: "<>c)
    Yafia.create_im(c, getGame(game))
    Yafia.combine_im()
  end
  

  @spec getGame(String.t())::String.t()
  def getGame(game) do
     case game do
       "gg" -> GuiltyGearXrd.inputs()
       "sf" -> StreetFighter.inputs()
        _   -> StreetFighter.inputs()
     end 
  end
end

Sip.call()
