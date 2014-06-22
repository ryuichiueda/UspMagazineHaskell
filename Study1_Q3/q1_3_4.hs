import System.Directory

main = digdir "/etc" >>= putStrLn . unlines

ls :: String -> IO [FilePath]
ls dir = getDirectoryContents dir >>= return . filter (`notElem` [".",".."])

digdir :: FilePath -> IO [FilePath]
digdir dir = ls dir >>= mapM (digdir' dir) >>= return . concat

digdir' :: FilePath -> FilePath -> IO [FilePath]
digdir' d f = do let p = d ++ "/" ++ f
                 b <- doesDirectoryExist p
                 if b then digdir p else return [p]
