import Data.List.Split

main = getContents >>= putStr . main'

main' :: String -> String
main' cs = unlines $ map getShell (lines cs)

getShell :: String -> String
getShell ln = last $ splitOn ":" ln
