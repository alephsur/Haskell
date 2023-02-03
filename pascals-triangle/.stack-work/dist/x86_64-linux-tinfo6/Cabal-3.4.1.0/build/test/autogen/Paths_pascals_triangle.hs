{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_pascals_triangle (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,5,0,9] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alephsur/Documentos/Exercisim/haskell/pascals-triangle/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/bin"
libdir     = "/home/alephsur/Documentos/Exercisim/haskell/pascals-triangle/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/lib/x86_64-linux-ghc-9.0.2/pascals-triangle-1.5.0.9-6OaX2ETE7joJnP3MYGNyUJ-test"
dynlibdir  = "/home/alephsur/Documentos/Exercisim/haskell/pascals-triangle/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/alephsur/Documentos/Exercisim/haskell/pascals-triangle/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/share/x86_64-linux-ghc-9.0.2/pascals-triangle-1.5.0.9"
libexecdir = "/home/alephsur/Documentos/Exercisim/haskell/pascals-triangle/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/libexec/x86_64-linux-ghc-9.0.2/pascals-triangle-1.5.0.9"
sysconfdir = "/home/alephsur/Documentos/Exercisim/haskell/pascals-triangle/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pascals_triangle_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pascals_triangle_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pascals_triangle_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pascals_triangle_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pascals_triangle_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pascals_triangle_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
