main :: IO ()
main = do
  seq <- getLine
  putStrLn $ show $ findPalindrome 4 seq

findPalindrome :: Int -> String -> Bool
findPalindrome n seq
  | take n seq == revComp (take n seq) = True
  | otherwise  =  False

revComp :: String -> String
revComp seq = reverse $ map complement seq

complement :: Char -> Char
complement 'A' = 'T'
complement 'C' = 'G'
complement 'G' = 'C'
complement 'T' = 'A'
complement  _  = 'N'
