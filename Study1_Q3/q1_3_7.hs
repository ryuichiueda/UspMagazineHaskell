import FileTools
import System.FilePath
import qualified Data.ByteString.Lazy.Char8 as B

main = find "/etc" >>= mapM judgeBashFile >>= mapM copyBashFile

judgeBashFile :: FilePath -> IO (String,Bool)
judgeBashFile file = cat file >>= return . (,) file . isBash
    where isBash bs = B.take 11 bs == B.pack "#!/bin/bash"

copyBashFile :: (String,Bool) -> IO ()
copyBashFile (file,False) = return ()
copyBashFile (file,True) = cat file >>= B.writeFile dest
    where dest = "/home/ueda/hoge/" ++ takeFileName file
