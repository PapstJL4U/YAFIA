defmodule GuiltyGearXrd do
  @moduledoc """
  Defines possible inputs for GuiltyGear
  """

  def inputs() do
    Standards.info()
    ++ ArcsysAdditional.info()
    ++ GuiltyGear.info()
    ++ Extras.info()
    ++ Complex.info()
  end
end
