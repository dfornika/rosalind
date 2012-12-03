module Main where

main :: IO ()
main = do
  seq <- getLine
  let len = length seq
  let restrict_sites' =
        filter (\x -> fst x /= 0) $
        concat $ map (findPalindrome seq) [4..12]
  let restrict_sites = zip (map (len -) (map fst restrict_sites'))
                           (map snd restrict_sites')

  mapM_ putStrLn $ map printOneSite restrict_sites

printOneSite :: (Int, Int) -> String
printOneSite (a, b) = (show a) ++ " " ++ (show b)

findPalindrome :: String -> Int -> [(Int, Int)]
findPalindrome [] _ = []
findPalindrome seq n
  | length seq < n = []
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
