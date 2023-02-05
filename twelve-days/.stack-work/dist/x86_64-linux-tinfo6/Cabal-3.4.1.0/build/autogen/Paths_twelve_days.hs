{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_twelve_days (
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
version = Version [1,2,0,5] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alephsur/Documentos/Exercisim/haskell/twelve-days/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/bin"
libdir     = "/home/alephsur/Documentos/Exercisim/haskell/twelve-days/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/lib/x86_64-linux-ghc-9.0.2/twelve-days-1.2.0.5-6u6IUnY0DhFxH5E8ivHc5"
dynlibdir  = "/home/alephsur/Documentos/Exercisim/haskell/twelve-days/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/alephsur/Documentos/Exercisim/haskell/twelve-days/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/share/x86_64-linux-ghc-9.0.2/twelve-days-1.2.0.5"
libexecdir = "/home/alephsur/Documentos/Exercisim/haskell/twelve-days/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/libexec/x86_64-linux-ghc-9.0.2/twelve-days-1.2.0.5"
sysconfdir = "/home/alephsur/Documentos/Exercisim/haskell/twelve-days/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "twelve_days_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "twelve_days_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "twelve_days_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "twelve_days_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "twelve_days_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "twelve_days_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
