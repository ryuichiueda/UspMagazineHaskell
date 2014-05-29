import Data.List
import Data.List.Split

main = getContents >>= putStr . unlines . shellCount . 
       sort . map (last . splitOn ":") . lines 

shellCount :: [String] -> [String]
shellCount []  = []
shellCount (s:ss) = (show (1 + length t) ++ (' ':s)) : shellCount d
    where t = takeWhile (== s) ss
          d = dropWhile (== s) ss
