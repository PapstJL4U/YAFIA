defmodule GuiltyGear do
  def info() do
  images = %{
              "p"=> {0, 0, 78, 78},
              "k"=> {77, 0, 78, 78},
              "s"=> {154 , 0, 78, 78},
              "hs"=> {233, 0, 78,78},
              "d"=> {312, 0, 78, 78}
  }
  ["assets/guiltygear.png": images] 
  end
end
