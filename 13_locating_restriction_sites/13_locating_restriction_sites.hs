main :: IO ()
main = do
  seq <- getLine
  putStrLn $ show $ map (findPalindrome seq) [4..12]

findPalindrome :: String -> Int -> [(Int, Int)]
findPalindrome [] _ = []
findPalindrome seq n
  | take n seq == revComp (take n seq) = (length seq, n) : findPalindrome (tail seq) n
  | otherwise                          = (0,0) : findPalindrome (tail seq) n

revComp :: String -> String
revComp seq = reverse $ map complement seq

complement :: Char -> Char
complement 'A' = 'T'
complement 'C' = 'G'
complement 'G' = 'C'
complement 'T' = 'A'
complement  _  = 'N'
