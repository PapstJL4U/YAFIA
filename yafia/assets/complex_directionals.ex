defmodule Complex do
@moduledoc """
The mapping for complex directionals like halfcircles, srk and charge motions.
"""
  def inputs() do
  images = %{
              
              "[2]"=> {0,0,46,81},
              "chargedown"=> {0,0,46,81},
              "chargeback" =>{107,0,81,46},
              "[4]" =>{107,0,81,46},
              "dash"=> {189,0,69,46},
              "srk"=> {47,0,59,66},
              "rsrk"=> {575,0,59,66},
              "dp"=> {47,0,59,66},
              "rdp"=> {575,0,59,66},
              "qcb"=> {433,0,70,64},
              "qcf"=> {505,0,70,64},
              "hcb"=> {258,0,87,64},
              "hcf"=> {346,0,87,64},
              "spd"=> {636,0,81,81},
              "fc"=> {636,0,81,81},
              "66"=> {189,0,69,46},
              "623"=> {47,0,59,66},
              "421"=> {575,0,59,66},
              "214"=> {433,0,70,64},
              "236"=> {505,0,70,64},
              "63214"=> {258,0,87,64},
              "41236"=> {346,0,87,64}

  }
  ["assets/complex_directionals.png": images] 
  end
end
