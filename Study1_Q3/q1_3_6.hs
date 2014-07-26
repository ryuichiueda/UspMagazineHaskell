import FileTools
import qualified Data.ByteString.Lazy.Char8 as B

main = find "/etc" >>= mapM judgeBashFile >>= print

judgeBashFile :: FilePath -> IO (String,Bool)
judgeBashFile file = cat file >>= return . ((,) file) . isBash
    where isBash bs = B.take 11 bs == B.pack "#!/bin/bash"
