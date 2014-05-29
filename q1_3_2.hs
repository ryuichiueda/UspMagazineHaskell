import System.Directory

main = ls "/etc/" >>= putStr . unlines

ls :: String -> IO [FilePath]
ls dir = getDirectoryContents dir >>= return . filter (`notElem` [".",".."])
