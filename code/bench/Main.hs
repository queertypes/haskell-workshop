module Main (main) where

import Criterion.Main

import Tutorial.Shift

main :: IO ()
main = defaultMain
  [ bench "Shift Left" $ nf (ShiftLBy [1..10000]) 10000
  , bench "Shift Right" $ nf (ShiftRBy [1..10000]) 10000
  ]
