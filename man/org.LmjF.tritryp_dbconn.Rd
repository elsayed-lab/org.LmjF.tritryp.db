
\name{org.LmjF.tritryp_dbconn}

\alias{org.LmjF.tritryp_dbconn}
\alias{org.LmjF.tritryp_dbfile}
\alias{org.LmjF.tritryp_dbschema}
\alias{org.LmjF.tritryp_dbInfo}


\title{Collect information about the package annotation DB}

\description{
  Some convenience functions for getting a connection object to (or collecting
  information about) the package annotation DB.
}

\usage{
  org.LmjF.tritryp_dbconn()
  org.LmjF.tritryp_dbfile()
  org.LmjF.tritryp_dbschema(file="", show.indices=FALSE)
  org.LmjF.tritryp_dbInfo()
}

\arguments{
  \item{file}{
    A connection, or a character string naming the file to print to (see
    the \code{file} argument of the \code{\link[base]{cat}} function for
    the details).
  }
  \item{show.indices}{
    The CREATE INDEX statements are not shown by default.
    Use \code{show.indices=TRUE} to get them.
  }
}

\details{
  \code{org.LmjF.tritryp_dbconn} returns a connection object to the
  package annotation DB.  IMPORTANT: Don't call
  \code{\link[DBI:dbConnect]{dbDisconnect}} on the connection object
  returned by \code{org.LmjF.tritryp_dbconn} or you will break all the
  \code{\link[AnnotationDbi:AnnDbObj-class]{AnnDbObj}} objects defined
  in this package!

  \code{org.LmjF.tritryp_dbfile} returns the path (character string) to the
  package annotation DB (this is an SQLite file).

  \code{org.LmjF.tritryp_dbschema} prints the schema definition of the
  package annotation DB.

  \code{org.LmjF.tritryp_dbInfo} prints other information about the package
  annotation DB.
}

\value{
  \code{org.LmjF.tritryp_dbconn}: a DBIConnection object representing an
  open connection to the package annotation DB.

  \code{org.LmjF.tritryp_dbfile}: a character string with the path to the
  package annotation DB.

  \code{org.LmjF.tritryp_dbschema}: none (invisible \code{NULL}).

  \code{org.LmjF.tritryp_dbInfo}: none (invisible \code{NULL}).
}

\seealso{
  \code{\link[DBI:dbSendQuery]{dbGetQuery}},
  \code{\link[DBI:dbConnect]{dbConnect}},
  \code{\link[AnnotationDbi:AnnDbObj-class]{dbconn}},
  \code{\link[AnnotationDbi:AnnDbObj-class]{dbfile}},
  \code{\link[AnnotationDbi:AnnDbObj-class]{dbschema}},
  \code{\link[AnnotationDbi:AnnDbObj-class]{dbInfo}}
}

\examples{
  ## Count the number of rows in the "genes" table:
  dbGetQuery(org.LmjF.tritryp_dbconn(), "SELECT COUNT(*) FROM genes")

  ## The connection object returned by org.LmjF.tritryp_dbconn() was
  ## created with:
  dbConnect(SQLite(), dbname=org.LmjF.tritryp_dbfile(), cache_size=64000,
  synchronous=0)

  org.LmjF.tritryp_dbschema()

  org.LmjF.tritryp_dbInfo()
}

\keyword{utilities}
\keyword{datasets}

