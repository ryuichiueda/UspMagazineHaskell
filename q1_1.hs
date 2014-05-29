main = getContents >>= putStr . main'

main' :: String -> String
main' cs = unlines $ map ( takeWhile (/= ':') ) ( lines cs )
