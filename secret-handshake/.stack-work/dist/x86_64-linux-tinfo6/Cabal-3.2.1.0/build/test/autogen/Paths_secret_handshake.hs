{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_secret_handshake (
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
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alephsur/Documentos/Exercisim/haskell/secret-handshake/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/bin"
libdir     = "/home/alephsur/Documentos/Exercisim/haskell/secret-handshake/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/lib/x86_64-linux-ghc-8.10.7/secret-handshake-1.2.0.6-7JsXiXhyRJv8fzWalr91qY-test"
dynlibdir  = "/home/alephsur/Documentos/Exercisim/haskell/secret-handshake/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/alephsur/Documentos/Exercisim/haskell/secret-handshake/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/share/x86_64-linux-ghc-8.10.7/secret-handshake-1.2.0.6"
libexecdir = "/home/alephsur/Documentos/Exercisim/haskell/secret-handshake/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/libexec/x86_64-linux-ghc-8.10.7/secret-handshake-1.2.0.6"
sysconfdir = "/home/alephsur/Documentos/Exercisim/haskell/secret-handshake/.stack-work/install/x86_64-linux-tinfo6/43d0c54deb43e3a695b5d6d42dd545b4f8500894d10ebc8de6b539fb7cf61d6d/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "secret_handshake_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "secret_handshake_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "secret_handshake_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "secret_handshake_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "secret_handshake_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "secret_handshake_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
