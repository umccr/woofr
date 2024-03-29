% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare.R
\name{manta_isec}
\alias{manta_isec}
\title{Intersect two Manta VCF files}
\usage{
manta_isec(f1, f2, samplename, flab, bnd_switch = TRUE)
}
\arguments{
\item{f1}{Path to first Manta file}

\item{f2}{Path to second ('truthset') Manta file}

\item{samplename}{Sample name (used for labelling).}

\item{flab}{File name (used for labelling).}

\item{bnd_switch}{Logical. Switch BND pairs for more matches (default: TRUE).}
}
\value{
A list with the following elements:
\itemize{
\item tot_vars: total variants for file1 and file2
\item fp: tibble with False Positive calls i.e. variants in f1 that are not in f2
\item fn: tibble with False Negative calls i.e. variants in f2 that are not in f1
}
}
\description{
Intersects two Manta VCF files for evaluation.
}
\examples{
\dontrun{
f1 <- "path/to/run1/manta.vcf.gz"
f2 <- "path/to/run2/manta.vcf.gz"
mi <- manta_isec(f1, f2)
}

}
