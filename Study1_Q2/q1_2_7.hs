import Data.List
import Data.List.Split

main = getContents >>= putStr . main'

main' :: String -> String
main' cs = unlines $ shellCount $ sort $ map getShell (lines cs)

getShell :: String -> String
getShell ln = last $ splitOn ":" ln

shellCount :: [String] -> [String]
shellCount []  = []
shellCount (s:ss) = (show (1 + length t) ++ (' ':s)) : shellCount d
    where t = takeWhile (== s) ss
          d = dropWhile (== s) ss
