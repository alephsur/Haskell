{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_strain (
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
version = Version [0,1,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alephsur/Documentos/Exercisim/haskell/strain/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/bin"
libdir     = "/home/alephsur/Documentos/Exercisim/haskell/strain/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/lib/x86_64-linux-ghc-8.10.7/strain-0.1.0.3-K60jkHminmdLRUpu3Ej9Lz-test"
dynlibdir  = "/home/alephsur/Documentos/Exercisim/haskell/strain/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/alephsur/Documentos/Exercisim/haskell/strain/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/share/x86_64-linux-ghc-8.10.7/strain-0.1.0.3"
libexecdir = "/home/alephsur/Documentos/Exercisim/haskell/strain/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/libexec/x86_64-linux-ghc-8.10.7/strain-0.1.0.3"
sysconfdir = "/home/alephsur/Documentos/Exercisim/haskell/strain/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "strain_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "strain_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "strain_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "strain_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "strain_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "strain_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
