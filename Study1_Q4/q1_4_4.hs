import Data.List

main = do cs <- getContents
          print $ count $ sort [ (read c :: Int) `div` 10 | c <- lines cs ]

count :: [Int] -> [(Int,Int)]
count [] = []
count ns = (h,len) : count d
    where h   = head ns
          len = length $ takeWhile (== h) ns
          d   = dropWhile (== h) ns
  
