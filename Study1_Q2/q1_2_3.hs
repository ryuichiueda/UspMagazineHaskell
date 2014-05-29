import Data.List
import Data.List.Split

main = getContents >>= putStr . main'

main' :: String -> String
main' cs = unlines $ shellCount $ map getShell (lines cs)

getShell :: String -> String
getShell ln = last $ splitOn ":" ln

shellCount :: [String] -> [String]
shellCount shs = map f [ (1,s) | s <- (sort shs) ]
    where f (n,str) = unwords [show n,str]

shellCount' :: [(Int,String)] -> [(Int,String)]
shellCount' shs = shs
