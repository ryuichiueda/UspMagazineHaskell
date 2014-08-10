main = do cs <- getContents
          print [ 10 * ( (read c :: Int) `div` 10 ) | c <- lines cs ]
