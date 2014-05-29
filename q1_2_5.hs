import Data.List
import Data.List.Split

main = getContents >>= putStr . main'

main' :: String -> String
main' cs = unlines $ shellCount $ map getShell (lines cs)

getShell :: String -> String
getShell ln = last $ splitOn ":" ln

shellCount :: [String] -> [String]
shellCount shs = map f $ shellCount' [ (1,s) | s <- (sort shs) ]
    where f (n,str) = unwords [show n,str]

shellCount' :: [(Int,String)] -> [(Int,String)]
shellCount' []  = []
shellCount' [a] = [a]
shellCount' ((n1,s1):(n2,s2):ss) 
 | s1 == s2     = (n1+n2,s1):ss
 | otherwise    = ((n1,s1):(n2,s2):ss)
