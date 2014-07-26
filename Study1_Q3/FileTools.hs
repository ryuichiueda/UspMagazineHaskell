module FileTools (
find,
ls,
cat
) where

import System.Directory
import System.IO.Error
import qualified Data.ByteString.Lazy.Char8 as B

cat :: FilePath -> IO B.ByteString
cat file = catchIOError (B.readFile file) (\e -> return $ B.pack []) 

ls :: String -> IO [FilePath]
ls dir = getDirectoryContents dir >>= return . filter (`notElem` [".",".."])

find :: FilePath -> IO [FilePath]
find dir = ls dir 
           >>= mapM (\x -> return $ dir ++ "/" ++ x) 
           >>= mapM find'
           >>= return . concat

find' :: FilePath -> IO [FilePath]
find' path = do b <- doesDirectoryExist path
                if b then find path else return [path]
