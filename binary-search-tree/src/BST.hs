module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where


data BST a = EmptyTree | Node a (BST a) (BST a) deriving (Eq, Show)


bstLeft :: BST a -> Maybe (BST a)
bstLeft EmptyTree = Nothing
bstLeft (Node a left right)  = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight EmptyTree = Nothing
bstRight (Node a left right) = Just right

bstValue :: BST a -> Maybe a
bstValue EmptyTree = Nothing
bstValue (Node x left rigth) = Just x

empty :: BST a
empty = EmptyTree

fromList :: Ord a => [a] -> BST a
fromList xs = foldl (flip insert) EmptyTree xs

insert :: Ord a => a -> BST a -> BST a
insert x EmptyTree = singleton x
insert x (Node y left right)
     | x <= y = Node y (insert x left) right
     | otherwise = Node y left (insert x right)

singleton :: a -> BST a
singleton x = Node x EmptyTree EmptyTree

toList :: BST a -> [a]
toList EmptyTree = []
toList (Node x left rigth) = toList left ++ [x] ++ toList rigth
