defmodule GuiltyGearXrd do
  @moduledoc """
  Defines possible inputs for GuiltyGear
  """

  def inputs() do
    Standards.info()
    ++ ArcsysAdditional.info()
    ++ GuiltyGear.info()
    ++ Complex.info() 
    ++ Complex.info()
    ++ Extras.info()
  end
end
