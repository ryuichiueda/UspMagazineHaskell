import Data.List

main = do cs <- getContents
          out $ count $ sort [ (read c :: Int) `div` 10 | c <- lines cs ]

count :: [Int] -> [(Int,Int)]
count [] = []
count ns = (h,len) : count d
    where h   = head ns
          len = length $ takeWhile (== h) ns
          d   = dropWhile (== h) ns

out :: [(Int,Int)] -> IO ()
out []           = return ()
out ((g,num):es) = putStrLn oneline >> out es
    where oneline = (show (g*10)) ++ "〜" ++ (show (g*10+9))
                    ++ " " ++ (show num)
