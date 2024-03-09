defmodule Standards do
  _images = %{"7" => {341,0,55,57},
       "8" =>{396,0,46,67},
       "9" => {444,0,55,57},
       "4" => {157,0,67,46},
       "5" => {226,0,46,46},
       "6" =>{272,0,67,46},
       "1" =>{0,0,55,57},
       "2" =>{55,0,48,67},
       "3" =>{102,0,54,56},
       "upleft"=> {341,0,55,57},
       "up" =>{396,0,46,67},
       "upright" =>{444,0,55,57},
       "left" =>{157,0,67,46},
       "neutral" =>{226,0,46,46},
       "right" =>{272,0,67,46},
       "downleft" =>{0,0,55,57},
       "down" =>{55,0,48,67},
       "downright" =>{102,0,54,56}
    }
  def info(), do: ["assets/standard_directionals.png": _images] 
end