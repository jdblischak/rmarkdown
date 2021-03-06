% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render.R
\name{render}
\alias{render}
\title{Render R Markdown}
\usage{
render(input, output_format = NULL, output_file = NULL,
  output_dir = NULL, output_options = NULL, output_yaml = NULL,
  intermediates_dir = NULL, knit_root_dir = NULL, runtime = c("auto",
  "static", "shiny", "shiny_prerendered"), clean = TRUE, params = NULL,
  knit_meta = NULL, envir = parent.frame(), run_pandoc = TRUE,
  quiet = FALSE, encoding = "UTF-8")
}
\arguments{
\item{input}{The input file to be rendered. This can be an R script (.R),
an R Markdown document (.Rmd), or a plain markdown document.}

\item{output_format}{The R Markdown output format to convert to. The option
\code{"all"} will render all formats defined within the file. The option can
be the name of a format (e.g. \code{"html_document"}) and that will render
the document to that single format. One can also use a vector of format
names to render to multiple formats. Alternatively, you can pass an output
format object (e.g. \code{html_document()}). If using \code{NULL} then the
output format is the first one defined in the YAML frontmatter in the input
file (this defaults to HTML if no format is specified there).}

\item{output_file}{The name of the output file. If using \code{NULL} then the
output filename will be based on filename for the input file. If a filename
is provided, a path to the output file can also be provided. Note that the
\code{output_dir} option allows for specifying the output file path as well,
however, if also specifying the path, the directory must exist. If
\code{output_file} is specified but does not have a file extension, an
extension will be automatically added according to the output format. To
avoid the automatic file extension, put the \code{output_file} value in
\code{\link{I}()}, e.g., \code{I('my-output')}.}

\item{output_dir}{The output directory for the rendered \code{output_file}.
This allows for a choice of an alternate directory to which the output file
should be written (the default output directory of that of the input file).
If a path is provided with a filename in \code{output_file} the directory
specified here will take precedence. Please note that any directory path
provided will create any necessary directories if they do not exist.}

\item{output_options}{List of output options that can override the options
specified in metadata (e.g. could be used to force \code{self_contained} or
\code{mathjax = "local"}). Note that this is only valid when the output
format is read from metadata (i.e. not a custom format object passed to
\code{output_format}).}

\item{output_yaml}{Paths to YAML files specifying output formats and their
configurations. The first existing one is used. If none are found, then
the function searches YAML files specified to the \code{output_yaml} top-level
parameter in the YAML front matter, _output.yml or _output.yaml, and then uses
the first existing one.}

\item{intermediates_dir}{Intermediate files directory. If a path is specified
then intermediate files will be written to that path. If \code{NULL},
intermediate files are written to the same directory as the input file.}

\item{knit_root_dir}{The working directory in which to knit the document;
uses knitr's \code{root.dir} knit option. If \code{NULL} then the behavior
will follow the knitr default, which is to use the parent directory of the
document.}

\item{runtime}{The runtime target for rendering. The \code{static} option
produces output intended for static files; \code{shiny} produces output
suitable for use in a Shiny document (see \code{\link{run}}). The default,
\code{auto}, allows the \code{runtime} target specified in the YAML metadata
to take precedence, and renders for a \code{static} runtime target otherwise.}

\item{clean}{Using \code{TRUE} will clean intermediate files that are created
during rendering.}

\item{params}{A list of named parameters that override custom params
specified within the YAML front-matter (e.g. specifying a dataset to read or
a date range to confine output to). Pass \code{"ask"} to start an
application that helps guide parameter configuration.}

\item{knit_meta}{(This option is reserved for expert use.) Metadata
generated by \pkg{knitr}.}

\item{envir}{The environment in which the code chunks are to be evaluated
during knitting (can use \code{\link{new.env}()} to guarantee an empty new
environment).}

\item{run_pandoc}{An option for whether to run pandoc to convert Markdown
output.}

\item{quiet}{An option to suppress printing of the pandoc command line.}

\item{encoding}{The encoding of the input file. See \code{\link{file}} for
more information.}
}
\value{
When \code{run_pandoc = TRUE}, the compiled document is written into
  the output file, and the path of the output file is returned. When
  \code{run_pandoc = FALSE}, the path of the Markdown output file, with
  attributes \code{knit_meta} (the \pkg{knitr} meta data collected from code
  chunks) and \code{intermediates} (the intermediate files/directories
  generated by \code{render()}).
}
\description{
Render the input file to the specified output format using pandoc. If the
input requires knitting then \code{\link[knitr:knit]{knit}} is called prior
to pandoc.
}
\details{
Note that the \pkg{knitr} \code{error} option is set to \code{FALSE} during
rendering (which is different from the \pkg{knitr} default value of
\code{TRUE}).

For additional details on rendering R scripts see
\link[=compile_notebook]{Compiling R scripts to a notebook}.

If no \code{output_format} parameter is specified then the output format is
read from the YAML front-matter of the input file. For example, the
following YAML would yield a PDF document:

\preformatted{
output: pdf_document
}

Additional format options can also be specified in metadata. For example:

\preformatted{
output:
  pdf_document:
    toc: true
    highlight: zenburn
}

Multiple formats can be specified in metadata. If no \code{output_format}
is passed to \code{render} then the first one defined will be used:

\preformatted{
output:
  pdf_document:
    toc: true
    highlight: zenburn
  html_document:
    toc: true
    theme: united
}

Formats specified in metadata can be any one of the built in formats (e.g.
\code{\link{html_document}}, \code{\link{pdf_document}}) or a format defined
in another package (e.g. \code{pkg::custom_format}).

If there is no format defined in the YAML then
\code{\link{html_document}} will be used.
}
\section{R Markdown}{

R Markdown supports all of the base pandoc markdown features as well as some
optional features for compatibility with GitHub Flavored Markdown (which
previous versions of R Markdown were based on). See
\code{\link{rmarkdown_format}} for details.
}

\examples{
\dontrun{
library(rmarkdown)

# Render the default (first) format defined in the file
render("input.Rmd")

# Render all formats defined in the file
render("input.Rmd", "all")

# Render a single format
render("input.Rmd", "html_document")

# Render multiple formats
render("input.Rmd", c("html_document", "pdf_document"))
}
}
\seealso{
\link[knitr:knit]{knit}, \link{output_format},
\href{http://johnmacfarlane.net/pandoc}{pandoc}
}
