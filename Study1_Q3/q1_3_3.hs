import System.Directory

main = digdir "/etc" >>= putStr . unlines

ls :: String -> IO [FilePath]
ls dir = getDirectoryContents dir >>= return . filter (`notElem` [".",".."])

digdir :: FilePath -> IO [FilePath]
digdir dir = ls dir 
             >>= mapM (\x -> return $ dir ++ "/" ++ x) 
