import FileTools

main = find "/etc" >>= putStr . unlines
