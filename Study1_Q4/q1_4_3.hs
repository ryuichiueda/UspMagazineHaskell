import Data.List

main = do cs <- getContents
          print $ sort [ (read c :: Int) `div` 10 | c <- lines cs ]
