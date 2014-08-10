import FileTools
import System.FilePath
import qualified Data.ByteString.Lazy.Char8 as B

main = find "/etc" >>= mapM judgeBashFile >>= mapM handleBashFile

judgeBashFile :: FilePath -> IO (String,Bool)
judgeBashFile file = cat file >>= return . (,) file . isBash
    where isBash bs = B.take 11 bs == B.pack "#!/bin/bash"

handleBashFile :: (String,Bool) -> IO ()
handleBashFile (file,False) = return ()
handleBashFile (file,True) = cat file >>= B.writeFile dest . chg
    where dest = "/home/ueda/hoge/" ++ takeFileName file
          chg cs = B.append (B.pack "#!/usr/local/bin/bash\n")
                            (B.unlines $ drop 1 $ B.lines cs)
