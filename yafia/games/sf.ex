defmodule StreetFighter do
  @moduledoc """
  Defines possible inputs for StreetFighter
  """
  
import Standards 
import SixButtons 
import Extras 
import Complex

  def Inputs do
    Standards.info() ++ SixButtons.info()
  end
end
