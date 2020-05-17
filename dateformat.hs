module FormatDate where

import Data.List 

formatDate :: Integral i => i -> String
formatDate n = 
  case (length times) of
    0 -> ""
    1 -> head times
    _ -> (intercalate ", " (init times)) ++ " and " ++ (last times)
  where times = filter (/="") $ zipWith pluralize (mods n) names
        names = ["year", "day", "hour", "minute", "second"]

mods :: Integral i => i -> [i]
mods n 
  = snd $ mapAccumL (\m x -> (m - (x * div m x), div m x)) n lengths
  where lengths = [365*24*60*60, 24*60*60, 60*60, 60, 1]

pluralize :: Integral i => i -> String -> String
pluralize n t = 
  case n of
    0 -> []
    1 -> n' ++ " " ++ t
    _ -> n' ++ " " ++ t ++ "s"
  where n' = show $ fromIntegral n
