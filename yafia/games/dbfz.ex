defmodule DragonballFighterz do
  @moduledoc """
  Defines possible inputs for GuiltyGear
  """

  def inputs() do
    Standards.inputs()
    ++ ArcsysAdditional.inputs()
    ++ Extras.inputs()
    ++ Complex.inputs()
  end
end
