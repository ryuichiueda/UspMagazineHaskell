import System.Directory

main = getDirectoryContents "/etc/" >>= putStr . unlines
