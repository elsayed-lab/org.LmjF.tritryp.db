datacache <- new.env(hash=TRUE, parent=emptyenv())

org.LmjF.tritryp <- function() showQCData("org.Lmajor.eg", datacache)
org.LmjF.tritryp_dbconn <- function() dbconn(datacache)
org.LmjF.tritryp_dbfile <- function() dbfile(datacache)
org.LmjF.tritryp_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache, file=file, show.indices=show.indices)
org.LmjF.tritryp_dbInfo <- function() dbInfo(datacache)

org.LmjF.tritrypORGANISM <- "Leishmania major"

.onLoad <- function(libname, pkgname)
{
    ## Connect to the SQLite DB
    dbfile <- system.file("extdata", "org.LmjF.tritryp.sqlite", package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)

    ## Create the OrgDb object
    sPkgname <- sub(".db$","",pkgname)
    db <- loadDb(system.file("extdata", paste(sPkgname,
      ".sqlite",sep=""), package=pkgname, lib.loc=libname),
                   packageName=pkgname)    
    dbNewname <- AnnotationDbi:::dbObjectName(pkgname,"OrgDb")
    ns <- asNamespace(pkgname)
    assign(dbNewname, db, envir=ns)
    namespaceExport(ns, dbNewname)
        
    packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.LmjF.tritryp.db"))
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(org.LmjF.tritryp_dbconn())
}

