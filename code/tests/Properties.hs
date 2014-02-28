module Main where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Tutorial.Shift

import Test.QuickCheck

prop_shiftl_shiftr_eq xs = shiftL (shiftR xs) == (xs :: [Int])

prop_shiftr_shiftl_eq xs = shiftR (shiftL xs) == (xs :: [Int])

prop_shiftlby_len_eq xs = shiftLBy xs (length xs) == (xs :: [Int])

prop_shiftrby_len_eq xs = shiftRBy xs (length xs) == (xs :: [Int])

tests = [
    testGroup "Sorting Group 1" [
      testProperty "ShiftLEq" prop_shiftl_shiftr_eq,
      testProperty "ShiftREq" prop_shiftr_shiftl_eq,
      testProperty "ShiftLBy Len Eq" prop_shiftlby_len_eq,
      testProperty "ShiftRBy Len Eq" prop_shiftrby_len_eq
    ]
  ]

main :: IO ()
main = defaultMain tests
