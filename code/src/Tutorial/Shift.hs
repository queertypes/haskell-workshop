module Tutorial.Shift where

shiftL :: [a] -> [a]
shiftL (x:xs) = xs ++ [x]
shiftL [] = []

shiftR :: [a] -> [a]
shiftR xs
  | null xs = []
  | otherwise = last xs : init xs


shiftBy :: ([a] -> [a]) -> [a] -> Int -> [a]
shiftBy f xs n = head $ drop n $ iterate f xs

shiftLBy :: [a] -> Int -> [a]
shiftLBy = shiftBy shiftL

shiftRBy :: [a] -> Int -> [a]
shiftRBy = shiftBy shiftR