module Primes where

import Data.List

-- Sieve of Eratosthenes
primesFast :: Int -> [Int]
primesFast x = 2 : primesFast' [] [3,5..x] (sqrI x)

primesFast' :: [Int] -> [Int] -> Int -> [Int]
primesFast' ps [] m = ps
primesFast' ps xs m = if x > m then (ps ++ xs) else primesFast' (x : ps) (filter (\y -> rem y x /= 0) xs) m
  where x = head xs

-- Crude, recursive brute force algorithms...okay for small sets, but O(n2) I reckon
noPrimes y = noPrimes' 2 y []
noPrimes' :: Integer -> Int -> [Integer] -> [Integer]
noPrimes' x z xs =
  if length xs == z then xs
  else if l1 == Nothing then noPrimes' (x+1) z ([x] ++ xs) else noPrimes' (x+1) z xs
  where sx = sqr x
        l1 = find (\y -> y <= sx && (rem x y == 0)) xs

primes y = primes' 2 y []
primes' :: Integer -> Integer -> [Integer] -> [Integer]
primes' x z xs =
  if x >= z then xs
  else if l1 == Nothing then primes' (x+1) z (xs ++ [x]) else primes' (x+1) z xs
  where sx = sqr x
        l1 = find (\y -> y <= sx && (rem x y == 0)) xs

sqr :: Integer -> Integer
sqr x = toInteger $ ceiling $ sqrt (fromIntegral x)

sqrI :: Int -> Int
sqrI x = floor $ sqrt (fromIntegral x)
