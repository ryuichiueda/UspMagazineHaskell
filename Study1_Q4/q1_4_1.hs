main = do cs <- getContents
          print [ read c :: Int | c <- lines cs ]
