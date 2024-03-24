defmodule GuiltyGearM do
  @moduledoc """
  Mapps P, K, S, c.S, HS and Dust
  """
  def inputs() do
  images = %{
             "p"=> {0, 0, 72, 72},
             "k"=>{73, 0, 72, 72},
             "c.s"=> {144 , 0, 72, 72},
             "s"=> {144 , 0, 72, 72},
             "h"=> {216, 0, 72, 72},
             "hs"=> {216, 0, 72, 72},
             "d"=> {287, 0, 72, 72}
  }
  ["assets/guiltygear_modern.png": images] 
  end
end
