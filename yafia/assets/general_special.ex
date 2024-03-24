defmodule General_Special do
  @moduledoc """
  Legacy Module
  """
  def inputs() do
  images = %{
              "d"=> {0,0,78,78},
              "h"=> {79,0,78,78},
              "hs"=> {79,0,78,78},
              "c.s" => {157,0,78,78},
              "s"=> {157,0,78,78}
  }
  ["assets/general_special.png": images] 
  end
end
