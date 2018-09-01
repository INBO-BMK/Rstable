FROM inbobmk/rlatex:3.5.0

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="RStable" \
      org.label-schema.description="A docker image with stable versions of R and a bunch of package. The full list of packages is available in the README." \
      org.label-schema.url="e.g. https://www.inbo.be/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="e.g. https://github.com/inbo/RStable" \
      org.label-schema.vendor="Research Institute for Nature and Forest" \
      maintainer="Thierry Onkelinx <thierry.onkelinx@inbo.be>"

## Install devtools and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-gnutls-dev \
    curl \
    git \
    libgit2-dev \
    libssl-dev \
    libssh2-1-dev \
  && apt-get clean \
  && ./cran_install.sh jsonlite 1.5 \
  && ./cran_install.sh mime 0.5 \
  && ./cran_install.sh curl 3.2 \
  && ./cran_install.sh digest 0.6.16 \
  && ./cran_install.sh R6 2.2.2 \
  && ./cran_install.sh magrittr 1.5 \
  && ./cran_install.sh stringi 1.2.4 \
  && ./cran_install.sh glue 1.3.0 \
  && ./cran_install.sh stringr 1.3.1 \
  && ./cran_install.sh openssl 1.0.2 \
  && ./cran_install.sh httr 1.3.1 \
  && ./cran_install.sh git2r 0.23.0  \
  && ./cran_install.sh memoise 1.1.0 \
  && ./cran_install.sh whisker 0.3-2 \
  && ./cran_install.sh rstudioapi 0.7 \
  && ./cran_install.sh withr 2.1.2 \
  && ./cran_install.sh devtools 1.13.6

## Install assertthat
RUN  ./cran_install.sh assertthat 0.2.0

## Install dplyr and dependencies
RUN  ./cran_install.sh Rcpp 0.12.18 \
  && ./cran_install.sh lazyeval 0.2.1 \
  && ./cran_install.sh DBI 1.0.0 \
  && ./cran_install.sh BH 1.66.0-1 \
  && ./cran_install.sh rlang 0.2.2 \
  && ./cran_install.sh crayon 1.3.4 \
  && ./cran_install.sh cli 1.0.0 \
  && ./cran_install.sh utf8 1.1.4 \
  && ./cran_install.sh fansi 0.3.0 \
  && ./cran_install.sh pillar 1.3.0 \
  && ./cran_install.sh tibble 1.4.2 \
  && ./cran_install.sh plogr 0.2.0 \
  && ./cran_install.sh bindr 0.1.1 \
  && ./cran_install.sh pkgconfig 2.0.2 \
  && ./cran_install.sh bindrcpp 0.2.2 \
  && ./cran_install.sh purrr 0.2.5 \
  && ./cran_install.sh tidyselect 0.2.4 \
  && ./cran_install.sh dplyr 0.7.6

## Install plyr
RUN  ./cran_install.sh plyr 1.8.4

## Install lubridate
RUN  ./cran_install.sh lubridate 1.7.4

## Install freetds
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    freetds-dev \
    freetds-bin \
    tdsodbc \
  && apt-get clean

## Install RODBC and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    pkg-config \
    libltdl7 \
    libodbc1 \
    unixodbc-dev \
  && apt-get clean \
  && ./cran_install.sh RODBC 1.3-15

## Install testthat and dependencies
RUN  ./cran_install.sh praise 1.0.0 \
  && ./cran_install.sh testthat 2.0.0

## Install rmarkdown and dependencies
RUN  ./cran_install.sh yaml 2.2.0 \
  && ./cran_install.sh evaluate 0.11 \
  && ./cran_install.sh formatR 1.5 \
  && ./cran_install.sh highr 0.7 \
  && ./cran_install.sh markdown 0.8 \
  && ./cran_install.sh knitr 1.20 \
  && ./cran_install.sh bitops 1.0-6 \
  && ./cran_install.sh caTools 1.17.1.1 \
  && ./cran_install.sh htmltools 0.3.6 \
  && ./cran_install.sh base64enc 0.1-3 \
  && ./cran_install.sh backports 1.1.2 \
  && ./cran_install.sh rprojroot 1.3-2 \
  && ./cran_install.sh rmarkdown 1.10

## Install covr and dependencies
RUN  ./cran_install.sh rex 1.1.2 \
  && ./cran_install.sh covr 3.1.0

## Install ggplot2 and dependencies
RUN  ./cran_install.sh colorspace 1.3-2 \
  && ./cran_install.sh munsell 0.5.0 \
  && ./cran_install.sh RColorBrewer 1.1-2 \
  && ./cran_install.sh dichromat 2.0-0 \
  && ./cran_install.sh labeling 0.3 \
  && ./cran_install.sh viridisLite 0.2.0 \
  && ./cran_install.sh scales 1.0.0 \
  && ./cran_install.sh reshape2 1.4.3 \
  && ./cran_install.sh gtable 0.2.0 \
  && ./cran_install.sh ggplot2 3.0.0

## Install xtable
RUN  ./cran_install.sh xtable 1.8-3

## Install igraph and its dependencies
RUN  apt-get update \
  && apt-get install -y --no-install-recommends \
    libxml2-dev \
  && ./cran_install.sh registry 0.5 \
  && ./cran_install.sh pkgmaker 0.27 \
  && ./cran_install.sh rngtools 1.3.1 \
  && ./cran_install.sh gridBase 0.4-7 \
  && ./cran_install.sh iterators 1.0.10 \
  && ./cran_install.sh foreach 1.4.4 \
  && ./cran_install.sh doParallel 1.0.11 \
  && ./cran_install.sh NMF 0.21.0 \
  && ./cran_install.sh irlba 2.3.2 \
  && ./cran_install.sh igraph 1.2.2

## install lintr and dependencies
RUN  ./cran_install.sh stringdist 0.9.5.1 \
  && ./cran_install.sh lintr 1.0.2

## install sp
RUN  ./cran_install.sh sp 1.3-1

## install tidyr
RUN  ./cran_install.sh tidyr 0.8.1

## install lme4
RUN  ./cran_install.sh minqa 1.2.4 \
  && ./cran_install.sh nloptr 1.0.4 \
  && ./cran_install.sh RcppEigen 0.3.3.4.0 \
  && ./cran_install.sh lme4 1.1-18-1

## install optimx and dependencies
RUN  ./cran_install.sh numDeriv 2016.8-1 \
  && ./cran_install.sh optextras 2016-8.8 \
  && ./cran_install.sh Rvmmin 2018-4.17 \
  && ./cran_install.sh Rcgmin 2013-2.21 \
  && ./cran_install.sh quadprog 1.5-5 \
  && ./cran_install.sh BB 2014.10-1 \
  && ./cran_install.sh ucminf 1.1-4 \
  && ./cran_install.sh setRNG 2013.9-1 \
  && ./cran_install.sh dfoptim 2018.2-1 \
  && ./cran_install.sh svUnit 0.7-12 \
  && ./cran_install.sh optimx 2013.8.7

## install shiny
RUN  ./cran_install.sh later 0.7.4 \
  && ./cran_install.sh promises 1.0.1 \
  && ./cran_install.sh httpuv 1.4.5 \
  && ./cran_install.sh sourcetools 0.1.7 \
  && ./cran_install.sh shiny 1.1.0

## install INLA
RUN  ./cran_install.sh MatrixModels 0.4-1 \
  && wget https://inla.r-inla-download.org/R/stable/src/contrib/INLA_18.07.12.tar.gz \
  && R CMD INSTALL INLA_18.07.12.tar.gz \
  && rm INLA_18.07.12.tar.gz

## install roxygen2 and dependencies
RUN ./cran_install.sh xml2 1.2.0 \
  && ./cran_install.sh brew 1.0-6 \
  && ./cran_install.sh desc 1.2.0 \
  && ./cran_install.sh commonmark 1.5 \
  && ./cran_install.sh ps 1.1.0 \
  && ./cran_install.sh processx 3.2.0 \
  && ./cran_install.sh callr 3.0.0 \
  && ./cran_install.sh pkgbuild 1.0.0 \
  && ./cran_install.sh pkgload 1.0.0 \
  && ./cran_install.sh roxygen2 6.1.0

## install RSQLite
RUN  ./cran_install.sh bit 1.1-14 \
  && ./cran_install.sh bit64 0.9-7 \
  && ./cran_install.sh prettyunits 1.0.2 \
  && ./cran_install.sh blob 1.1.1 \
  && ./cran_install.sh RSQLite 2.1.1

## install mvtnorm
RUN  ./cran_install.sh mvtnorm 1.0-8

## install snowfall
RUN  ./cran_install.sh snow 0.4-2 \
  && ./cran_install.sh snowfall 1.84-6.1

## install rgeos
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     libgeos++-dev \
  && ./cran_install.sh rgeos 0.3-28

## install multimput
RUN wget https://github.com/inbo/multimput/archive/v0.2.8.1.tar.gz \
  && R CMD INSTALL v0.2.8.1.tar.gz \
  && rm v0.2.8.1.tar.gz

## install aws.s3
RUN  ./cran_install.sh aws.signature 0.4.4 \
  && ./cran_install.sh aws.s3 0.3.12

## install RPostgreSQL
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libpq-dev \
  && ./cran_install.sh RPostgreSQL 0.6-2

## install pander
RUN  ./cran_install.sh pander 0.6.2

## install DT
RUN  ./cran_install.sh htmlwidgets 1.2 \
  && ./cran_install.sh crosstalk 1.0.0 \
  && ./cran_install.sh DT 0.4

## install plotly
RUN  ./cran_install.sh hexbin 1.27.2 \
  && ./cran_install.sh viridisLite 0.3.0 \
  && ./cran_install.sh data.table 1.11.4 \
  && ./cran_install.sh plotly 4.8.0

## install osmar
RUN  ./cran_install.sh XML 3.98-1.16 \
  && ./cran_install.sh RCurl 1.95-4.11 \
  && ./cran_install.sh geosphere 1.5-7 \
  && ./cran_install.sh osmar 1.1-7

## install rgdal
RUN apt-get update \
  && apt-get install  -y --no-install-recommends \
    libgdal-dev \
    libproj-dev \
  && apt-get clean \
  && ./cran_install.sh rgdal 1.3-4

## install bookdown and webshot
RUN  ./cran_install.sh bookdown 0.7 \
  && ./cran_install.sh debugme 1.1.0 \
  && ./cran_install.sh webshot 0.5.0 \
  && Rscript -e "webshot::install_phantomjs()"

## install dbplyr
RUN  ./cran_install.sh dbplyr 1.2.2

## install profvis
RUN  ./cran_install.sh profvis 0.3.5

## install readr
RUN  ./cran_install.sh hms 0.4.2 \
  && ./cran_install.sh readr 1.1.1

## install pool
RUN  ./cran_install.sh pool 0.1.4.1

## Start R
CMD ["R", "--no-save", "--no-restore"]
